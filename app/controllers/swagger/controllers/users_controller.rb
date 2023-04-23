# frozen_string_literal: true

class Swagger::Controllers::UsersController
    include Swagger::Blocks
  
    swagger_path '/users' do
        operation :post do
            key :description, 'Creates a new client in the system'
            key :tags, [
                'Client'
            ]
  
            parameter do
                key :first_name, :phone_number
                key :in, :body
                key :description, 'First Name, Last Name, Email and Phone number information of the new client'
                key :required, true
                schema do
                    key :'$ref', :UserInput
                end
            end

            response 201 do
                key :description, 'Client created'
                schema do
                    property :data do
                        key :'$ref', :User
                    end
        
                    property :meta do
                        key :'$ref', :Meta
                    end
                end
            end

            response 422 do
                key :description, 'Unprocessable Entity'
                schema do
                    key :'$ref', :Error
                end
            end
        end
    end
end