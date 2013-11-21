class UsersController < ApplicationController
  
  respond_to :json
  
  def index
    @users = User.all
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
  end
end