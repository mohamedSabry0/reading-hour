class CreateTimeBlocks < ActiveRecord::Migration[6.0]
  def change
    create_table :time_blocks do |t|
      t.string :name
      t.integer :amount
      t.integer :author_id
      t.timestamps
    end
  end
end
