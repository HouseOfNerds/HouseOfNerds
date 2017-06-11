# frozen_string_literal: true

class CreateLoans < ActiveRecord::Migration[5.1]
  def change
    create_table :loans do |t|
      t.references :customer, foreign_key: true, null: false
      t.references :asset_type, foreign_key: true, null: false
      t.integer :quantity
      t.datetime :returned_at

      t.timestamps
    end
  end
end
