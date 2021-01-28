require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.feature 'Groups', type: :feature do
  let(:picture) { 'app/assets/images/iconfinder_Development_5355692.png' }
  before do
    visit 'users/sign_up'
    fill_in 'Username', with: 'per3'
    fill_in 'Email', with: 'per3@e.com'
    fill_in 'Password', with: '123123'
    fill_in 'Password confirmation', with: '123123'
    click_on 'Sign up'
    visit groups_path
  end
  describe 'actions' do
    context 'no icon' do
      it '#create' do
        visit 'groups/new'
        fill_in 'Name', with: 'test1'
        click_button 'Create/Update Group'
        expect(page).to have_content('Group was successfully created.')
      end
      before do
        click_on 'New Group'
        fill_in 'Name', with: 'test1'
        click_on 'Create/Update Group'
        visit groups_path
      end
      it '#index' do
        expect(page).to have_content('test1')
      end
      it '#edit' do
        click_on 'Edit'
        fill_in 'Name', with: 'test2'
        click_on 'Update Group'
        expect(page).to have_content('Group was successfully updated.')
      end
      it '#edit failing' do
        click_on 'Edit'
        fill_in 'Name', with: ''
        click_on 'Update Group'
        expect(page).to have_content("Name can't be blank")
      end
      it '#destroy' do
        expect(page).to have_content('Destroy')
        page.accept_confirm do
          click_on 'Destroy'
        end
        expect(page).to have_content('Group was successfully destroyed.')
      end
      scenario 'failing to create' do
        visit 'groups/new'
        fill_in 'Name', with: ''
        click_button 'Create/Update Group'
        expect(page).to have_content("Name can't be blank")
      end
    end
    context 'with icon' do
      it '#create' do
        visit 'groups/new'
        fill_in 'Name', with: 'test1'
        attach_file 'group_icon', picture
        click_button 'Create/Update Group'
        expect(page).to have_content('Group was successfully created.')
      end
      before do
        click_on 'New Group'
        fill_in 'Name', with: 'test1'
        attach_file 'group_icon', picture
        click_on 'Create/Update Group'
        visit groups_path
      end
      it '#index' do
        expect(page).to have_content('test1')
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
