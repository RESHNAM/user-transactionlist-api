# frozen_string_literal: true

class Swagger::Controllers::TransactionsController
    include Swagger::Blocks
  
    swagger_path '/users/:user_id/transactions' do
        operation :post do
            key :description, 'Creates a new transaction for a user in the system'
            key :tags, [
                'Transactions'
            ]
  
            parameter do
                key :debit, :credit
                key :in, :body
                key :description, 'Debit, Credit, Total and Created By information of the new client transaction'
                key :required, true
                schema do
                    key :'$ref', :TransactionInput
                end
            end

            response 201 do
                key :description, 'Transaction created'
                schema do
                    property :data do
                        key :'$ref', :Transaction
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