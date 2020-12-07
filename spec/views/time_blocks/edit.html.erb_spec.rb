require 'rails_helper'

RSpec.describe 'time_blocks/edit', type: :view do
  before(:each) do
    @time_block = assign(:time_block, TimeBlock.create!(
                                        name: 'MyString',
                                        amount: 1
                                      ))
  end

  it 'renders the edit time_block form' do
    render

    assert_select 'form[action=?][method=?]', time_block_path(@time_block), 'post' do
      assert_select 'input[name=?]', 'time_block[name]'

      assert_select 'input[name=?]', 'time_block[amount]'
    end
  end
end
