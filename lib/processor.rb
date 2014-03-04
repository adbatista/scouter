class Processor
  attr_reader :repository

  def initialize repository
    @repository            = repository
    @complexity_processor  = FlogCLI.new
  end
  
  def process
    path = create_repository @repository

    analyze_complexity path

  ensure
    destroy_files path
  end

  def analyze_complexity repository_path
    @complexity_processor.flog *repository_path
  end

  def data
    {url: @repository, score: complexity_score}
  end

  def complexity_score
    @complexity_processor.total_score
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