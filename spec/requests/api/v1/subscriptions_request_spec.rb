require 'rails_helper'

describe 'Subscriptions API' do
  context 'happy path' do
    it 'gets all subscriptions by customer id' do
      customer = create(:customer)
      tea_1 = create(:tea)
      tea_2 = create(:tea)
      subscription_1 = create(:subscription, customer_id: customer.id, tea_id: tea_1.id)
      subscription_2 = create(:subscription, customer_id: customer.id, tea_id: tea_2.id)

      get "/api/v1/customers/#{customer.id}/subscriptions"

      expect(response).to be_successful
    end

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

      post "/api/v1/customers/#{customer.id}/subscriptions", headers: header, params: JSON.generate(subscription)

      expect(response).to be_successful
    end

    it 'deletes a subscription' do
      customer = create(:customer)
      tea = create(:tea)
      subscription = create(:subscription, customer_id: customer.id, tea_id: tea.id)

      expect(Subscription.count).to eq(1)

      delete "/api/v1/customers/#{customer.id}/subscriptions/#{subscription.id}"

      expect(response).to be_successful

      expect(Subscription.count).to eq(0)
    end
  end
end