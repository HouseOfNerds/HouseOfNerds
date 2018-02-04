# frozen_string_literal: true

class AddVerifiedToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :verified, :boolean, null: false, default: true
    change_column_default :customers, :verified, from: true, to: nil
  end
end
