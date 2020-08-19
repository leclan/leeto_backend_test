class AddSeniority < ActiveRecord::Migration[6.0]
  def change
    add_column :perks, :seniority, :integer
    add_column :employees, :hire_date, :date
  end
end
