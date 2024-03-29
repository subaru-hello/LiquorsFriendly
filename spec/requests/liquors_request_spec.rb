# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Liquor, type: :request do
  describe '/liquors' do
    it do
      get liquors_path
      expect(response).to have_http_status(200)
    end
  end
end
