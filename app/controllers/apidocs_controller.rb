# frozen_string_literal: true

class ApidocsController < ActionController::Base
    include Swagger::Blocks
  
    swagger_root do
      key :swagger, '2.0'
  
      info do
        key :version, '1.0.0'
        key :title, 'Client Transaction List API'
        key :description, 'Client Transaction List API documentation'
  
        contact do
          key :name, 'duetcode.io'
        end
      end
  
      key :host, 'localhost:3000'
      key :basePath, '/'
      key :consumes, ['application/json']
      key :produces, ['application/json']
      key :schemes,  ['http']
    end
  
    # A list of all classes that have swagger_* declarations.
    SWAGGERED_CLASSES = [
        Swagger::Controllers::AppUsersController,
        Swagger::Models::Error,
        Swagger::Models::Meta,
        Swagger::Models::AppUser,
        Swagger::Models::AppUserInput,
        Swagger::Controllers::OauthController,
        Swagger::Models::OauthTokenInput,
        Swagger::Models::OauthToken,
        Swagger::Controllers::UsersController,
        Swagger::Controllers::TransactionsController,
        self
    ].freeze
  
    def index
      render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
    end
  end