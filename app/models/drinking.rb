# frozen_string_literal: true

class Drinking < ApplicationRecord
  def start_time
    starts_at # #Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
  end
end
