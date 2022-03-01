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
end