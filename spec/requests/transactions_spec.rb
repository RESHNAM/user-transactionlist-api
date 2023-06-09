require 'rails_helper'

RSpec.describe 'Transactions API' do
  # Initialize the test data
  let!(:app_user) { create(:app_user) }
  let!(:user) { create(:user, app_user_id: app_user.id) }
  let!(:transactions) { create_list(:transaction, 20, user_id: user.id) }
  let(:user_id) { user.id }
  let(:id) { transactions.first.id }
  let(:headers) { valid_headers }

  # Test suite for GET /users/:user_id/transactions
  describe 'GET /users/:user_id/transactions' do
    before { get "/users/#{user_id}/transactions", params: {}, headers: headers }

    context 'when user exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all user transactions' do
        expect(json.size).to eq(20)
      end
    end

    context 'when user does not exist' do
      let(:user_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end
  end

  # Test suite for GET /users/:user_id/transactions/:id
  describe 'GET /users/:user_id/transactions/:id' do
    before { get "/users/#{user_id}/transactions/#{id}", params: {}, headers: headers }

    context 'when user transaction exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the transaction' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when user transaction does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Transaction/)
      end
    end
  end

  # Test suite for PUT /users/:user_id/transactions
  describe 'POST /users/:user_id/transactions' do
    let(:valid_attributes) { { credit: 10, debit: 0, total: 10, user_id: 'Visit Narnia', done: false } }

    context 'when request attributes are valid' do
      before { post "/users/#{user_id}/transactions", params: valid_attributes, headers: headers }

      it 'example at' do
        #puts valid_attributes[:credit].to_i
        #puts :credit
        :total == valid_attributes[:total].to_i + valid_attributes[:credit].to_i
      end

      it 'example at' do
        #puts valid_attributes[:debit]
        #puts :debit
        :total == valid_attributes[:total].to_i - valid_attributes[:debit].to_i
      end


      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/users/#{user_id}/transactions", params: {}, headers: headers }


      it 'returns status code 422' do
        expect(response).to have_http_status(422)

      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Total can't be blank/)
      end
    end
  end

  # Test suite for PUT /users/:user_id/transactions/:id
  describe 'PUT /users/:user_id/transactions/:id' do
    let(:valid_attributes) { { user_id: 'Mozart' } }

    before { put "/users/#{user_id}/transactions/#{id}", params: valid_attributes, headers: headers }

    context 'when transaction exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the item' do
        updated_transaction = Transaction.find(id)
		#puts updated_transaction.inspect
		#puts user.id
        #expect(updated_transaction.user_id).to match(/Mozart/)
		expect(updated_transaction.user_id).to eq(user.id)
      end
    end

    context 'when the transaction does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Transaction/)
      end
    end
  end

  # Test suite for DELETE /users/:id
  describe 'DELETE /users/:id' do
    before { delete "/users/#{user_id}/transactions/#{id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end