class AuthenticateUser
    def initialize(email, password)
      @email = email
      @password = password
    end
  
    # Service entry point
    def call
      JsonWebToken.encode(user_id: app_user.id) if app_user
    end
  
    private
  
    attr_reader :email, :password
  
    # verify user credentials
    def app_user
      app_user = AppUser.find_by(email: email)
      return app_user if app_user && app_user.authenticate(password)
      # raise Authentication error if credentials are invalid
      raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
    end
  end