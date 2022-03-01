class AddCustomerRefToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_reference :subscriptions, :customer, foreign_key: true
  end
end
