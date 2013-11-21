class UsersController < ApplicationController
  
  respond_to :json
  
  def index
    @users = params[:id] ? User.where('id in (?)', params[:id].split(","))  : User.all
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
  end
end