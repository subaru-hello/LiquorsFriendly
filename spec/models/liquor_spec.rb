# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Liquor, type: :model do
  it { should have_many(:tags) }
  it { should have_many(:comments) }
  it { should have_many(:drinkings).through(:tags) }
end
