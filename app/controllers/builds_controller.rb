class BuildsController < ApplicationController
  # GET /builds
  def index
    @builds = Build.all
  end

  # GET /builds/1
  def show
    @build = Build.find(params[:id])
  end

  # GET /builds/new
  def new
    @build = Build.new
  end

  # POST /builds
  def create
    @build = Build.new(build_params)

    respond_to do |format|
      if @build.save
        format.html { redirect_to @build, notice: 'Build was successfully created.' }
      else
        format.html { render 'new' }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def build_params
      params.require(:build).permit(:repository_id, :state)
    end
end
