class ContentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show, :edit, :destroy]
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
  
  def edit
    @content = Content.find(params[:id])
  end

  def update
    @content = Content.find(params[:id])
    if @content.update(content_params)
      redirect_to content_path(@content.id)
    else
      render :edit
    end
  end

  def destroy
    content = Content.find(params[:id])
    content.destroy
    redirect_to action: 'index'
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
