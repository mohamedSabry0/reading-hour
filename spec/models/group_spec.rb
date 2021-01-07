require 'rails_helper'

RSpec.describe Group, type: :model do
    
    describe 'validations' do
        it { should validate_length_of(:name).is_at_least(3).is_at_most(12) }
        it { should validate_presence_of(:name) }
    end

    describe 'associations' do
        it { should belong_to(:user) }
        it { should have_many(:groupings).dependent(:destroy) }
        it { should have_many(:time_blocks) }
    end
end
