class AddCustomerRefToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_reference :subscriptions, :customer, null: false, foreign_key: true
  end
end
