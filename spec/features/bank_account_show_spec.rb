require 'rails_helper'

feature 'Bank Accounts Show', js: true do
  login_js

  context 'with bank account' do
    before(:each) do
      @account_count = 1
      @bank_account = FactoryGirl.create_list(:bank_account, @account_count, user: @user)
      visit bank_account_path(@bank_account)
    end

    scenario 'finds an account show view' do
      expect(page).to have_content('Current Balance')
    end

    scenario 'finds an institution' do
      @inst = @user.bank_accounts[0].institution
      expect(page).to have_content(@inst)
      expect(page).to have_selector('#institution')
    end

    scenario 'back to accounts link is on the page' do
      expect(page).to have_selector('.back-to-accounts', count: @account_count)
    end

  end
end
