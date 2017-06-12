# frozen_string_literal: true

class MakeAddresssAndBirthdateMandatoryForCustomers < ActiveRecord::Migration[5.1]
  def change
    reversible do |dir|
      dir.up do
        execute "UPDATE customers SET address = 'Skriv inn adresse' WHERE address IS NULL"
        execute "UPDATE customers SET birthdate = '2004-06-03' WHERE birthdate IS NULL"
      end
    end
    change_column_null :customers, :address, false
    change_column_null :customers, :birthdate, false
  end
end
