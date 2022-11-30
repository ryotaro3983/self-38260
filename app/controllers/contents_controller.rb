class ContentsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      redirect_to action: "index"
    else
      render :new
    end
  end

  private

  def content_params
    params.require(:content).permit(:title, :genre, :memo, :image).merge(user_id: current_user.id)
  end
end