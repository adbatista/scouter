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
        score:      class_details[:total_score]
      }
    end
  end
end