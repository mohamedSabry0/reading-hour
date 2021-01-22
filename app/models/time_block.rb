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
    # &:name works like {|x| x.name} and was changed by rubocop
    groups.collect(&:name).join(', ')
  end

  def group_list=(groups_string)
    group_names = groups_string.split(',').collect { |s| s.strip.downcase }.uniq
    found_groups = group_names.collect { |name| Group.find_by_name(name) }
    self.groups = found_groups
  end
end
