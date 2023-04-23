# frozen_string_literal: true

module Swagger::Models::UserInput
    include Swagger::Blocks
  
    swagger_schema :UserInput do
        key :required, %i[user]
        property :user do
            key :type, :object
            key :required, %i[first_name last_name email_address phone_number]

            property :first_name do
                key :type, :string
            end

            property :last_name do
                key :type, :string
            end
  
            property :email_address do
                key :type, :string
            end
  
            property :phone_number do
                key :type, :string
            end
        end
    end
end