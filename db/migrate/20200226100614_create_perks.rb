class CreatePerks < ActiveRecord::Migration[6.0]
  def change
    create_table :perks do |t|
      t.references :organisation, null: false, foreign_key: true
      t.string :name
      t.decimal :amount
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
