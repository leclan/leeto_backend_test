class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.references :organisation, null: false, foreign_key: true
      t.string :email
      t.string :password_digest
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :seniority, null: false, default: 0, comment: "Number of months in the organisation"

      t.timestamps
    end
    add_index :employees, :email, unique: true
  end
end
