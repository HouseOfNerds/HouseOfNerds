# frozen_string_literal: true

class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :email, null: false
      t.string :name
      t.string :phone
      t.string :address
      t.string :postal_code
      t.date :birthdate
      t.binary :image_content
      t.binary :image_content_type

      t.timestamps
    end
  end
end
