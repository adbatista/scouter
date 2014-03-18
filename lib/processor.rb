require 'forwardable'
require 'stringio'
require 'fileutils'

class Processor
  extend Forwardable

  def_delegator :@complexity_processor, :flog, :analyze_complexity

  attr_reader :repository

  def initialize complexity=FlogCLI.new
    @complexity_processor = complexity
  end

  def process repository
    path = create_repository repository

    @complexity_processor.flog *path
    @complexity_processor.calculate
  ensure
    destroy_files path
  end

  def class_details
    @complexity_processor.scores.map do |klass,score|
      {class_name: klass, score: score}
    end
  end

  private
  def create_repository repository
    name = Time.now.to_i.to_s
    path = Rails.root.join 'tmp','repos'

    Git.clone repository, name, path: "#{path}"
    path.join name
  end

  def destroy_files path
    FileUtils.remove_dir path, force: true
  end
end