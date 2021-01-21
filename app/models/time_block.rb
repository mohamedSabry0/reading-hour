class TimeBlock < ApplicationRecord
  validates :name, presence: true, length: { in: 3..15 }
  validates :amount, presence: true
  belongs_to :author, class_name: 'User'
  has_many :groupings, dependent: :destroy
  has_many :groups, through: :groupings

  def self.non_grouped
    left_outer_joins(:groups).where('group_id is null')
  end

  def group_list
    groups.collect(&:name).join(', ')
  end

  def group_list=(groups_string)
    group_names = groups_string.split(',').collect { |s| s.strip.downcase }.uniq
    found_groups = group_names.collect { |name| Group.find_by_name(name) }
    self.groups = found_groups
  end
  require 'csv'
 
  
  def export_csv(table)
    file = "#{Rails.root}/public/#{table.first.author.name}_time_blocks.csv"
    table = table;0
    CSV.open( file, 'w' ) do |writer|
      writer << table.first.attributes.map { |a,v| a }
      table.each do |s|
        writer << s.attributes.map { |a,v| v }
      end
    end
  end
  
end
