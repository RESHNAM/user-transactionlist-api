# frozen_string_literal: true

module Swagger::Models::UserAllInput
    include Swagger::Blocks
  
    swagger_schema :UserAllInput do
        key :required, %i[user]
        property :user do
            key :type, :object
        end
    end
end