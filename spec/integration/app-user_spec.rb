require 'swagger_helper'

describe 'Application User Transaction List API' do
    path '/signup' do
        post 'Creates a user in the Application' do
            tags 'App-Users'
            consumes 'application/json', 'application/xml'
            parameter name: :app_user, in: :body, schema: {
                type: :object,
                properties: {
                    name: { type: :string },
                    email_address: { type: :string },
                    password_digest: { type: :string }
                },
                required: [ 'name', 'email_address', 'password_digest' ]
            }

            response '201', 'pet created' do
                let(:app_user) { { name: 'Dodo', email_address: 'available@gmail.com', password_adigest: 'pass!123' } }
                run_test!
            end

            response '422', 'invalid request' do
                let(:app_user) { { name: 'foo' } }
                run_test!
            end
        end
    end
end 