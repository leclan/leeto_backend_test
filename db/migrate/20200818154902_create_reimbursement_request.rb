class CreateReimbursementRequest < ActiveRecord::Migration[6.0]
  def change
    create_table :reimbursement_requests do |t|
      t.references :perk, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.decimal :amount, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
