class UsersController < ApplicationController
  def show
    @user = current_user
    @post = Post.where(user_id: current_user.id).last
  end
end
