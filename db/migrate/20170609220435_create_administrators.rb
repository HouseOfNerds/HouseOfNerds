# frozen_string_literal: true

class CreateAdministrators < ActiveRecord::Migration[5.1]
  def change
    create_table :administrators do |t|
      t.string :email, null: false, index: :unique
      t.string :name
      t.string :security_token
      t.datetime :security_token_stored_at
      t.datetime :inactivated_at
      t.string :phone, index: :unique
      t.string :address
      t.string :postal_code
      t.date :birthdate

      t.timestamps
    end
  end
end
