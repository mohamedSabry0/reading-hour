require 'rails_helper'
# rubocop:disable Metrics/BlockLength

RSpec.feature 'ReadingHours', type: :feature do
  let(:picture) { 'app/assets/images/iconfinder_Development_5355692.png' }
  before do
    visit 'users/sign_up'
    fill_in 'Username', with: 'per2'
    fill_in 'Email', with: 'per2@e.com'
    fill_in 'user_password', with: '123123'
    fill_in 'Password confirmation', with: '123123'
    click_on 'Sign up'
  end
  scenario 'creating, failing to edit, editing, and deleting' do
    visit time_blocks_path
    click_on 'New Time Block'
    fill_in 'Name', with: 'test1'
    fill_in 'Amount', with: 1
    click_on 'Create/Update Time Block'
    expect(page).to have_content('Time block was successfully created.')
    click_on 'Edit'
    fill_in 'Name', with: 'test2'
    click_on 'Create/Update Time Block'
    expect(page).to have_content('Time block was successfully updated.')
    click_on 'Edit'
    fill_in 'Name', with: ''
    click_on 'Create/Update Time Block'
    expect(page).to have_content("Name can't be blank and Name is too short (minimum is 3 characters)")
    visit time_blocks_path
    page.accept_confirm do
      click_on 'Destroy'
    end
    expect(page).to have_content('Time block was successfully destroyed.')
  end
  describe 'with a group and icon' do
    before do
      visit 'groups/new'
      fill_in 'Name', with: 'testgroup'
      attach_file 'group_icon', picture
      click_button 'Create/Update Group'
    end
    it '#create' do
      visit time_blocks_path
      click_on 'New Time Block'
      fill_in 'Name', with: 'test3'
      fill_in 'Amount', with: 1
      find('ul.chosen-choices').click
      find('li.highlighted').click
      click_on 'Create/Update Time Block'

      expect(page).to have_content('Time block was successfully created')
    end
    it '#index' do
      visit time_blocks_path
      click_on 'New Time Block'
      fill_in 'Name', with: 'test3'
      fill_in 'Amount', with: 1
      find('ul.chosen-choices').click
      find('li.highlighted').click
      click_on 'Create/Update Time Block'
      visit time_blocks_path
      expect(page).to have_content('test3')
    end
  end
  scenario 'failing to create' do
    visit time_blocks_path
    click_on 'New Time Block'
    fill_in 'Name', with: 'test1'
    fill_in 'Amount', with: nil
    click_on 'Create/Update Time Block'
    expect(page).to have_content("Amount can't be blank")
  end
end
# rubocop:enable Metrics/BlockLength
