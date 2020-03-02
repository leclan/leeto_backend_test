class CreatePerks < ActiveRecord::Migration[6.0]
  def change
    create_table :perks do |t|
      t.references :organisation, null: false, foreign_key: true
      t.string :name, null: false
      t.decimal :amount, null: false
      t.date :start, null: false
      t.date :end, null: false

      t.timestamps
    end
  end
end
