class ClassDetailsController < ApplicationController
  def show
    @class_detail = ClassDetail.find params[:id]
  end
end
