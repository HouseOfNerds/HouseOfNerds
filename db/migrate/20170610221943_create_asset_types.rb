# frozen_string_literal: true

class CreateAssetTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :asset_types do |t|
      t.string :name, null: false, limit: 128

      t.timestamps
    end
  end
end
