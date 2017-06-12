# frozen_string_literal: true

class AddParentalApprovalToCustomers < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :parental_approval, :boolean
  end
end
