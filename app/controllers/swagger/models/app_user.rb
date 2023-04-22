# frozen_string_literal: true

class Swagger::Models::AppUser
    include Swagger::Blocks
  
    swagger_schema :AppUser do
        key :type, :object
        key :required, %i[id email_address password_digest created_at updated_at]
  
        property :id do
            key :type, :integer
            key :format, :int64
        end
  
        property :email_address do
            key :type, :string
        end

        property :password_digest do
            key :type, :string
        end
  
        property :created_at do
            key :type, :string
            key :format, 'date-time'
        end
  
        property :updated_at do
            key :type, :string
            key :format, 'date-time'
        end
    end
end