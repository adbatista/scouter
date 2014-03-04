class RepositoriesController < ApplicationController
  def show
    @repository = Repository.find params[:id]
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Repository not found"
  end

  def create
    @repository = Repository.new repository_params

    process_and_assign_respository_data if @repository.valid?

    respond_to do |format|
      if @repository.save
        format.html { redirect_to @repository, notice: 'Repository was successfully created.' }
      else
        format.html { render action: 'new' }
      end
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

  def process_and_assign_respository_data
    processor = Processor.new @repository.url
    processor.process
    @repository.attributes = processor.data
    @repository.method_details = processor.method_details.map do |detail|
      MethodDetail.new(detail: detail)
    end
  end
end