# frozen_string_literal: true

json.extract! administrator, :id, :email, :name, :password_digest, :phone, :address, :postal_code, :birthdate, :created_at, :updated_at
json.url administrator_url(administrator, format: :json)
