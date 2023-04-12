class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    # get current user Users
    #@users = User.all
    @users = current_user.users
    json_response(@users)
  end

  # POST /users
  def create
    #@user = User.create!(user_params)
    @user = current_user.users.create!(user_params)
    json_response(@user, :created)
  end

  # GET /users/:id
  def show
    json_response(@user)
  end

  # PUT /users/:id
  def update
    @user.update(user_params)
    head :no_content
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    head :no_content
  end

  private

  def user_params
    # whitelist params
    params.permit(:first_name, :last_name, :phone_number, :email_address)
  end

  def set_user
    @user = User.find(params[:id])
  end

  
end
