require 'rails_helper'

describe 'Customers API' do
  context 'happy path' do
    it 'gets one customer by id' do
      customer = create(:customer)

      get "/api/v1/customers/#{customer.id}"

      expect(response).to be_successful

      customer = JSON.parse(response.body, symbolize_names: true)

      expect(customer[:data][:attributes]).to have_key(:first_name)
      expect(customer[:data][:attributes][:first_name]).to be_a(String)
      expect(customer[:data][:attributes]).to have_key(:last_name)
      expect(customer[:data][:attributes][:last_name]).to be_a(String)
      expect(customer[:data][:attributes]).to have_key(:email)
      expect(customer[:data][:attributes][:email]).to be_a(String)
      expect(customer[:data][:attributes]).to have_key(:address)
      expect(customer[:data][:attributes][:address]).to be_a(String)
    end
  end

  context 'sad path' do
    it 'sends an error code if customer does not exist' do

      get "/api/v1/customers/5000"

      error = (JSON.parse(response.body, symbolize_names: true))[:errors]

      expect(response).to_not be_successful

      expect(error[:details]).to eq("A customer with this id does not exist.")
    end
  end
end