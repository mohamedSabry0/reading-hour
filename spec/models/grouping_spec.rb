require 'rails_helper'

RSpec.describe Grouping, type: :model do
    describe 'associations' do
        it { should belong_to(:time_block) }
        it { should belong_to(:group) }
    end
end
