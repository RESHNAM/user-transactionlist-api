class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    json_response(@users)
  end

  # POST /user
  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  # GET /user/:id
  def show
    json_response(@user)
  end

  # PUT /user/:id
  def update
    @user.update(user_params)
    head :no_content
  end

  # DELETE /user/:id
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
