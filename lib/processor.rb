require 'forwardable'
require 'stringio'

class Processor
  extend Forwardable

  def_delegator :@complexity_processor, :total_score, :complexity_score
  def_delegator :@complexity_processor, :flog, :analyze_complexity

  attr_reader :repository

  def initialize repository
    @repository            = repository
    @complexity_processor  = FlogCLI.new
  end

  def process
    path = create_repository @repository

    analyze_complexity *path
  ensure
    destroy_files path
  end

  def method_details
    result = StringIO.new
    @complexity_processor.output_details result
    result.rewind
    result.readlines.select{|line| line != "\n"}
  end

  def data
    {url: @repository, score: complexity_score}
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