class CreateSubscriptionPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :subscription_plans do |t|
      t.string :name
      t.string :stripe_plan_name
      t.string :paypal_plan_name
    end
    add_monetize :subscription_plans, :price, currency: { present: true }
  end
end
