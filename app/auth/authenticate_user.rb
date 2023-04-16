class AuthenticateUser
    def initialize(email_address, password)
      @email = email_address
      @password = password
    end
  
    # Service entry point
    def call
      JsonWebToken.encode(app_user_id: app_user.id) if app_user
    end
  
    private
  
    attr_reader :email, :password
  
    # verify user credentials
    def app_user
      app_user = AppUser.find_by(email_address: email)
      #return app_user if app_user && app_user.authenticate(password)
      return app_user if app_user && app_user.password_digest()
      
      # raise Authentication error if credentials are invalid
      raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
    end
  end