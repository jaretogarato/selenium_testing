require 'rails_helper'

feature 'Bank Account Edit', js: true do
  login_js

  context 'with bank account' do
    before(:each) do
      @account_count = 1
      @bank_account = FactoryGirl.create_list(:bank_account, @account_count, user: @user)
      visit edit_bank_account_path(@bank_account)
    end

    scenario 'finds an account edit view' do
      expect(page).to have_content('Editing Bank Account')
    end

    scenario 'finds an update button' do
      expect(page).to have_selector('#submit-button')
    end



  end
end
