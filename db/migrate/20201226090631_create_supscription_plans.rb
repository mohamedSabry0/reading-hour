class CreateSupscriptionPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :supscription_plans do |t|
      t.string :name
      t.string :stripe_plan_name
      t.string :paypal_plan_name
    end
    add_monetize :supscription_plans, :price, currency: { present: true }
  end
end
