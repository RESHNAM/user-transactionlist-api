class AppUsersController < ApplicationController
    skip_before_action :authorize_request, only: :create
    
    # POST /signup
    # return authenticated token upon signup
    def create
        app_user = AppUser.create!(app_user_params)
        auth_token = AuthenticateUser.new(app_user.email, app_user.password).call
        response = { message: Message.account_created, auth_token: auth_token }
        json_response(response, :created)
    end

    private

    def app_user_params
        params.permit(
        :name,
        :email,
        :password,
        :password_confirmation
        )
    end
end
