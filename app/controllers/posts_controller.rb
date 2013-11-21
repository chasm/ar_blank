class PostsController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    @posts = params[:id] ? @user.posts.find(params[:id].split(","))  : @user.posts
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
  end
end