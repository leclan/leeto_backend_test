class CreateReimbursementRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :reimbursement_requests do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :perk, null: false, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
