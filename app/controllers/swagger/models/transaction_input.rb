# frozen_string_literal: true

module Swagger::Models::TransactionInput
    include Swagger::Blocks
  
    swagger_schema :TransactionInput do
        key :required, %i[transaction]
        property :transaction do
            key :type, :object
            key :required, %i[credit debit total]

            property :credit do
                key :type, :decimal
            end

            property :debit do
                key :type, :decimal
            end
  
            property :total do
                key :type, :decimal
            end
        end
    end
end