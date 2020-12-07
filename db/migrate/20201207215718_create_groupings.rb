class CreateGroupings < ActiveRecord::Migration[6.0]
  def change
    create_table :groupings do |t|

      t.timestamps
    end
    add_reference :groupings, :time_block, references: :time_blocks, index: true
    add_foreign_key :groupings, :time_blocks, column: :time_block_id
    add_reference :groupings, :group, references: :groups, index: true
    add_foreign_key :groupings, :groups, column: :group_id
  end
end
