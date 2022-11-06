# frozen_string_literal: true

class LiquorsController < ApplicationController
  def index
    @liquors = Liquor.all
  end
end
