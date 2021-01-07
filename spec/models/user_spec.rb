require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'validations' do
        it { should validate_presence_of(:username) }
        it { should validate_length_of(:username).is_at_least(3).is_at_most(12) }
        it { should validate_uniqueness_of(:username) }
    end

    describe 'associations' do
        it { should have_many(:time_blocks) }
        it { should have_many(:groups) }
    end
end
