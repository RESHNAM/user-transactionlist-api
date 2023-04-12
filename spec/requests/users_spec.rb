require 'rails_helper'

RSpec.describe "Users API", type: :request do
  # initialize test data
  let(:app_user) { create(:app_user)}
  let!(:users) { create_list(:user, 10, created_by: app_user.id) }
  let(:user_id) { users.first.id }
  # authorize request
  let(:headers) { valid_headers }

  # Test Suite for GET /users
  describe "GET /users" do
    # make HTTP get request before each example
    before { get '/users', params: {}, headers: headers }

    it 'returns users' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /users/:id
  describe 'GET /users/:id' do
    before { get "/users/#{user_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the user' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(user_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:user_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end
  end

  # Test suite for POST /users
  describe 'POST /users' do
    #let(:valid_attributes) { { first_name: 'Renney', last_name: 'Namale' } }
    let(:valid_attributes) do

      # send json payload
      { first_name: 'Renney', last_name: 'Namale', created_by: app_user.id.to_s }.to_json
    end


    context 'when the request is valid' do
      before { post '/users', params: valid_attributes, headers: headers }

      it 'creates a user' do
        expect(json['first_name']).to eq('Renney')
        expect(json['last_name']).to eq('Namale')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { first_name: nil, last_name: nil }.to_json }
      before { post '/users', params: invalid_attributes, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        #puts response.body.inspect
        expect(response.body).to match(/Validation failed: First name can't be blank, Last name can't be blank/)
      end
    end
  end

  # Test suite for PUT /users/:id
  describe 'PUT /users/:id' do
    let(:valid_attributes) { { first_name: 'Renney' }.to_json }

    context 'when the record exists' do
      before { put "/users/#{user_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /users/:id
  describe 'DELETE /users/:id' do
    before { delete "/users/#{user_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end