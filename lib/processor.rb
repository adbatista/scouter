require 'forwardable'
require 'metric_fu'

class Processor
  extend Forwardable

  def_delegator :@complexity_processor, :flog, :analyze_complexity

  attr_reader :repository

  def initialize metric=MetricFu, repo_handler=RepositoryHandler.new
    @metric_processor   = metric
    @repository_handler = repo_handler
  end

  def process repository
    path = @repository_handler.create_repository repository
    Dir.chdir path do
      @metric_processor.run_only %w{ flog }
    end
  ensure
    @repository_handler.destroy_repository path
  end

  def class_details
    @metric_processor.result[:flog][:method_containers].map do |method_container|
      {
        class_name: method_container[:name],
        score:      method_container[:total_score]
      }
    end
  end
end