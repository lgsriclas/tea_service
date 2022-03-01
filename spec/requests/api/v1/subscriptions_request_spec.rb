require 'rails_helper'

describe 'Subscriptions API' do
  customer = create(:customer)
  subscription = create(:subscription, customer: customer)
  context 'happy path' do
    it 'creates a subscription' do
    end
  end
end