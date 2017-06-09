# frozen_string_literal: true

json.extract! customer, :id, :email, :name, :password_digest, :phone, :address, :postal_code, :birthdate, :created_at, :updated_at
json.url customer_url(customer, format: :json)
