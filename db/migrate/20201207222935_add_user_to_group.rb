class AddUserToGroup < ActiveRecord::Migration[6.0]
  def change
    add_reference :groups, :user, references: :users, index: true
    add_foreign_key :groups, :users, column: :user_id
  end
end
