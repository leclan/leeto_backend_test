class CreatePerks < ActiveRecord::Migration[6.0]
  def change
    create_table :perks do |t|
      t.references :organisation, null: false, foreign_key: true
      t.string :name
      t.integer :period, comment: "Period in months"
      t.integer :maximum_amount, comment: "Maximum amount in euros"

      t.timestamps
    end
    add_index :perks, :name, unique: true
  end
end
