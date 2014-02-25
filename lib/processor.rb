class Processor
  attr_reader :repository, :score

  def initialize(repository)
    @repository = repository
  end
  
  def process
    path = create_repository @repository
    files =  FlogCLI.expand_dirs_to_files path
    flog = Flog.new
    flog.flog *files
    
    @score = flog.total_score
    destroy_files path
    self
  end

  def data
    {url: @repository, score: @score}
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