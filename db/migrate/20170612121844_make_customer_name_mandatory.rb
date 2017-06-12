# frozen_string_literal: true

class MakeCustomerNameMandatory < ActiveRecord::Migration[5.1]
  def change
    reversible { |dir| dir.up { execute 'UPDATE customers SET name = email WHERE name IS NULL' } }
    change_column_null :customers, :name, false
  end
end
