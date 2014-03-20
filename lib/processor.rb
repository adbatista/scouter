require 'forwardable'

class Processor
  extend Forwardable

  def_delegator :@complexity_processor, :flog, :analyze_complexity

  attr_reader :repository

  def initialize complexity=FlogCLI.new, repo_handler=RepositoryHandler.new
    @complexity_processor = complexity
    @repository_handler = repo_handler
  end

  def process repository
    path = @repository_handler.create_repository repository

    @complexity_processor.flog *path
    @complexity_processor.calculate
  ensure
    @repository_handler.destroy_repository path
  end

  def class_details
    @complexity_processor.scores.map do |klass,score|
      {class_name: klass, score: score}
    end
  end
end