require 'rails_helper'

describe 'Subscriptions API' do
  context 'happy path' do
    it 'creates a subscription' do
      customer = create(:customer)
      tea = create(:tea)
      subscription = ({
                        title: "Green",
                        price: 40,
                        status: "Active",
                        frequency: "Monthly",
                        customer_id: customer.id,
                        tea_id: tea.id

                      })

      header = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/subscriptions", headers: header, params: JSON.generate(subscription)

      expect(response).to be_successful
    end
  end
end