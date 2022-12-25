# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'UserAuth', type: :system do
  describe 'Login' do
    context 'when already have an account' do
      let(:user) { create(:user) }

      it do
        visit root_path
        click_link 'ログイン'
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'Log in'
        expect(page).to have_content('Signed in successfully.')
      end
    end

    context 'when do not have an account' do
      let(:user) { build(:user) }
      it do
        visit root_path
        click_link 'ログイン'
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        click_button 'Log in'
        expect(page).to have_no_content('Signed in successfully.')
      end
    end
  end

  describe 'SignUp' do
    context 'when success' do
      let(:user) { build(:user) }
      it do
        visit root_path
        click_link '会員登録'
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password
        fill_in 'Password confirmation', with: user.password
        click_button 'Sign up'
        expect(page).to have_content('Welcome! You have signed up successfully.')
      end
    end
  end
end
