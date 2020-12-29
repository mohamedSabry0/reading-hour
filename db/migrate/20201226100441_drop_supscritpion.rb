class DropSupscritpion < ActiveRecord::Migration[6.0]
  def change
    drop_table :supscription_plans
  end
end
