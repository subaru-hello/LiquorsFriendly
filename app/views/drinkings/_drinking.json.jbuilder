# frozen_string_literal: true

json.extract! drinking, :id, :name, :starts_at, :created_at, :updated_at
json.url drinking_url(drinking, format: :json)
