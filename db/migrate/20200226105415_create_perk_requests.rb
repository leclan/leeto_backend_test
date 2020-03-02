class CreatePerkRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :perk_requests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :perk, null: false, foreign_key: true
      t.decimal :amount, null: false

      t.timestamps
    end
  end
end
