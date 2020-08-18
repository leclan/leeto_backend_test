class CreatePerk < ActiveRecord::Migration[6.0]
  def change
    create_table :perks do |t|
      t.string :name
      t.decimal :maximum_amount, precision: 8, scale: 2
      t.datetime :start_date
      t.datetime :end_date
      t.references :organisation, null: false, foreign_key: true
    end
  end
end
