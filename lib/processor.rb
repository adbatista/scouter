require 'metric_fu'
require 'metric_fu/run'

class Processor
  def initialize metric=MetricFu, repo_handler=RepositoryHandler.new
    @metric_processor   = metric
    @repository_handler = repo_handler
  end

  def process repository
    path = @repository_handler.create_repository repository
    options = {}

    Dir.chdir path do
      @metric_processor.run_only %w{ flog }, options
    end

  ensure
    @repository_handler.destroy_repository path
  end

  def class_details
    @metric_processor.result.result_hash[:flog][:method_containers].map do |class_details|
      {
        class_name: class_details[:name],
        score:      class_details[:total_score],
        method_details: method_details(class_details[:methods])
      }
    end
  end

  private
  def method_details methods
    puts methods
    methods.map do |method_full_name, details|
      {
        name: method_full_name,
        score: details[:score]
      }
    end
  end
end