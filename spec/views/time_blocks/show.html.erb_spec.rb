require 'rails_helper'

RSpec.describe "time_blocks/show", type: :view do
  before(:each) do
    @time_block = assign(:time_block, TimeBlock.create!(
      name: "Name",
      amount: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
