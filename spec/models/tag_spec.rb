# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tag, type: :model do
  it { should belong_to(:drinking) }
  it { should belong_to(:liquor) }
end
