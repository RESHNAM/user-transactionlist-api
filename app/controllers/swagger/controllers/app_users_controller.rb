# frozen_string_literal: true

class Swagger::Controllers::AppUsersController
    include Swagger::Blocks
  
    swagger_path '/users' do
        operation :post do
            key :description, 'Creates a new application user in the system'
            key :tags, [
                'app_user'
            ]
  
            parameter do
                key :name, :email_address
                key :in, :body
                key :description, 'Email and password information of the new user'
                key :required, true
                schema do
                    key :'$ref', :AppUserInput
                end
            end

            response 201 do
                key :description, 'User created'
                schema do
                    property :data do
                        key :'$ref', :AppUser
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