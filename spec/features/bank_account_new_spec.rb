require 'rails_helper'

feature 'Bank Account New', js: true do
  login_js

  context 'with bank account' do
    before(:each) do
      @account_count = 1
      @bank_account = FactoryGirl.create_list(:bank_account, @account_count, user: @user)
      visit new_bank_account_path(@bank_account)
    end

    scenario 'finds an account new view' do
      expect(page).to have_content('New Bank Account For')
    end

    scenario 'finds link to all accounts' do
      expect(page).to have_selector('.back-to-accounts', count: @account_count)
    end

  end
end
