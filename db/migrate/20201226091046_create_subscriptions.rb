class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.integer :subscription_plan_id
      t.integer :user_id
      t.integer :status
      t.string :token
      t.string :charge_id
      t.string :error_message
      t.string :customer_id
      t.integer :payment_gateway
    end
    add_monetize :subscriptions, :price, currency: { present: false }
  end
end
