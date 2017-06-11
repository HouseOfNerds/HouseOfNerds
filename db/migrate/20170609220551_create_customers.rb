# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :email, null: false, limit: 128, index: :unique
      t.string :name, limit: 64
      t.string :phone, limit: 32, index: :unique
      t.string :address, limit: 64
      t.string :postal_code, limit: 10
      t.date :birthdate
      t.binary :image_content
      t.string :image_content_type, limit: 64

      t.timestamps
    end
  end
end
