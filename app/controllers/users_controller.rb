class UsersController < ApplicationController

  def show
    @user = User.find_by(params[:uuid])
    @posts = @user.posts
    
  end

  def index
    @users = User.all
  end
end
