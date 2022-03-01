class AddTeaRefToSubscriptions < ActiveRecord::Migration[6.0]
  def change
    add_reference :subscriptions, :tea, null: false, foreign_key: true
  end
end
