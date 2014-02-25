class RepositoriesController < ApplicationController
  def show
    @repository = Repository.find params[:id]
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Repository not found"
  end

  def create
    processor = Processor.new repository_params[:url]
    processor.process
    repo = Repository.new processor.data
    if repo.save
      redirect_to repo
    else
      redirect_to repositories_path, alert: "There is a repository with this name"
    end
   end 

  def new
    @repository = Repository.new
  end

  def index
    @repositories = Repository.all
  end

  private
    def repository_params
      params.require(:repository).permit(:url)
    end
end
