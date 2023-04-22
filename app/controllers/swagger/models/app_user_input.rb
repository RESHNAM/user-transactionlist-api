# frozen_string_literal: true

#module Swagger::Models::UserInput
module Swagger::Models::AppUserInput
    include Swagger::Blocks
  
    #swagger_schema :UserInput do
    swagger_schema :AppUserInput do
        key :required, %i[app_user]
        property :app_user do
            key :type, :object
            key :required, %i[email_address password_digest]
  
            property :email_address do
                key :type, :string
            end
  
            property :password_digest do
                key :type, :string
            end
        end
    end
end