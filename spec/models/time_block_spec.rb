require 'rails_helper'

RSpec.describe TimeBlock, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(3).is_at_most(15) }
    it { should validate_presence_of(:amount) }
  end

  describe 'associations' do
    it { should belong_to(:author).class_name('User') }
    it { should have_many(:groupings).dependent(:destroy) }
    it { should have_many(:groups).through(:groupings) }
  end

  before do
    user = User.create!(username: 'per', email: 'per1@e.com', password: '123123')
    @block = TimeBlock.create!(name: 'first', amount: 1, author_id: user.id)
    @group = Group.create!(name: 'test', user_id: user.id)
    @group2 = Group.create!(name: 'test2', user_id: user.id)
    @grouped_block = TimeBlock.create!(name: 'second', amount: 1, author_id: user.id, group_list: 'test, test2')
  end

  describe '.non_grouped' do
    it 'return time block with no group' do
      expect(TimeBlock.non_grouped).to eq([@block])
    end
  end
  describe '.group_list=(groups_string)' do
    it 'assigns group to time block correctly' do
      expect(@grouped_block.groups.first).to eq(@group)
    end
  end
  describe '.group_list' do
    it 'list all group names of a specific block' do
      expect(@grouped_block.group_list).to eq(@grouped_block.groups.map(&:name).join(', '))
    end
  end
end
