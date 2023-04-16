module ControllerSpecHelper
    # generate tokens from app_user id
    def token_generator(app_user_id)
      JsonWebToken.encode(app_user_id: app_user_id)
    end
  
    # generate expired tokens from user id
    def expired_token_generator(app_user_id)
      JsonWebToken.encode({ app_user_id: app_user_id }, (Time.now.to_i - 10))
    end
  
    # return valid headers
    def valid_headers
      {
        "Authorization" => token_generator(app_user.id),
        "Content-Type" => "application/json"
      }
    end
  
    # return invalid headers
    def invalid_headers
      {
        "Authorization" => nil,
        "Content-Type" => "application/json"
      }
    end
  end