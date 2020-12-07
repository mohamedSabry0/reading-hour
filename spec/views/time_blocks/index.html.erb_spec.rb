require 'rails_helper'

RSpec.describe 'time_blocks/index', type: :view do
  before(:each) do
    assign(:time_blocks, [
             TimeBlock.create!(
               name: 'Name',
               amount: 2
             ),
             TimeBlock.create!(
               name: 'Name',
               amount: 2
             )
           ])
  end

  it 'renders a list of time_blocks' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
  end
end
