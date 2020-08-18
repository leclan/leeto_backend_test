class CreateEmployee < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.references :organisation, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
