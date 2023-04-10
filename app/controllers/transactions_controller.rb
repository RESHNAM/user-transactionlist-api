class TransactionsController < ApplicationController
    before_action :set_user
    before_action :set_user_transaction, only: [:show, :update, :destroy]
    
    # GET /users/:user_id/transactions
    def index
        json_response(@user.transactions)
    end
    
    # GET /users/:user_id/transactions/:id
    def show
        json_response(@transaction)
    end
    
    # POST /users/:user_id/transactions
    def create
        @user.transactions.create!(transaction_params)
        puts transaction_params['total']

        if transaction_params['credit']
            @user.transactions.update(:total = transaction_params['total'] + transaction_params['credit']) 
        elsif transaction_params['debit']
            @user.transactions.update(:total = transaction_params['total'] - transaction_params['debit'])
        else
            def another_method
            end
        end 


        json_response(@user, :created)
    end
    
    # PUT /users/:user_id/transactions/:id
    def update
        @transaction.update(transaction_params)
        head :no_content
    end
    
    # DELETE /users/:user_id/transactions/:id
    def destroy
        @transaction.destroy
        head :no_content
    end
    
    private
    
    def transaction_params
        params.permit(:credit, :debit, :total, :user_id)
    end

    def individual_transaction_params
        params.permit(:credit, :debit, :total)
    end
    
    def set_user
        @user = User.find(params[:user_id])
    end
    
    def set_user_transaction
        @transaction = @user.transactions.find_by!(id: params[:id]) if @user
    end
end

