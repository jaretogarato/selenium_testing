require 'rails_helper'

feature 'Bank Account Login And Logout', js: true do
  login_js

  context 'with not logged in' do
    before(:each) do
      @account_count = 1
      # @bank_account = FactoryGirl.create_list(:bank_account, @account_count, user: @user)
      # visit root_path
    end

    scenario 'logs in and logs out' do
      visit root_path
      expect(page).to have_content('All Of My Monies')
      expect(page).to have_selector('#logout')
      # ('#logout').click
      all('#logout').first.click
      expect(page).to have_content('Log in')
    end
  end
end
