class ChangeAuthorColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :time_blocks, :author_id

    add_reference :time_blocks, :author, references: :users, index: true
    add_foreign_key :time_blocks, :users, column: :author_id
  end
end
