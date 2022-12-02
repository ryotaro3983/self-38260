class ContentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show]
  before_action :move_to_index, only:[:edit, :destroy]
  
  def index
    @contents = Content.includes(:user).order('created_at DESC')
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def show
    @content = Content.find(params[:id])
  end

  private

  def content_params
    params.require(:content).permit(:title, :genre, :memo, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @contents = Content.find(params[:id])
    return unless current_user.id != @contents.user_id

    redirect_to action: :index
  end
end
