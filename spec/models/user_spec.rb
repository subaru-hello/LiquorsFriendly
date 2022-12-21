# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:drinkings) }
    it { should have_many(:comments) }
  end
end
