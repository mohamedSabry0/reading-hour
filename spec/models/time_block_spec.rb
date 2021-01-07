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
end
