# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Drinkings', type: :request do
  shared_context 'create drinking and login' do
    let(:user) { create(:user) }
    let(:drinking) { create(:drinking, user:) }

    before do
      sign_in user
    end
  end

  describe 'GET /drinkings' do
    context 'with login' do
      let(:user) { build(:user) }
      before do
        sign_in user
      end

      it do
        get drinkings_path
        expect(response).to have_http_status(200)
      end
    end

    context 'without login' do
      it do
        get drinkings_path
        is_expected.to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET /drinkings/:id' do
    include_context 'create drinking and login'
    it do
      get drinking_path(drinking)

      expect(response).to have_http_status(200)
    end
  end

  describe 'DESTROY /drinkings/:id' do
    include_context 'create drinking and login'

    it do
      delete drinking_path(drinking)
      is_expected.to redirect_to(drinkings_path)
    end
  end
end
