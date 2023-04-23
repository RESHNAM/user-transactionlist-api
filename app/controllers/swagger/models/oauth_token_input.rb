# frozen_string_literal: true

module Swagger::Models::OauthTokenInput
    include Swagger::Blocks
  
    swagger_schema :OauthTokenInput do
        key :type, :object
        key :required, %i[email_address password_digest grant_type]
    
        property :email_address do
            key :type, :string
        end
    
        property :password_digest do
            key :type, :string
        end
    
        property :grant_type do
            key :type, :string
        end
    end
  end