require 'rails_helper'

RSpec.describe 'time_blocks/new', type: :view do
  before(:each) do
    assign(:time_block, TimeBlock.new(
                          name: 'MyString',
                          amount: 1
                        ))
  end

  it 'renders new time_block form' do
    render

    assert_select 'form[action=?][method=?]', time_blocks_path, 'post' do
      assert_select 'input[name=?]', 'time_block[name]'

      assert_select 'input[name=?]', 'time_block[amount]'
    end
  end
end
