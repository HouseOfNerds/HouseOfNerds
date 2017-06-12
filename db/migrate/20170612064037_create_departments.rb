# frozen_string_literal: true

class CreateDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :departments do |t|
      t.string :name, null: false, limit: 32, index: :unique
      t.string :domain, null: false, limit: 32, index: :unique

      t.timestamps
    end

    add_column :administrators, :department_id, :bigint, references: :department

    reversible do |dir|
      dir.up do
        oslo = Department.create! name: 'Oslo', domain: 'houseofnedrs.no'
        Department.create! name: 'Stavanger', domain: 'honstavanger.no'
        Administrator.all.each { |a| a.update! department_id: oslo.id }
      end
    end

    change_column_null :administrators, :department_id, false
  end

  class Department < ApplicationRecord
  end
  class Administrator < ApplicationRecord
  end
end
