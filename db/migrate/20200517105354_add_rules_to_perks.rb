class AddRulesToPerks < ActiveRecord::Migration[6.0]
  def change
    add_column :perks, :rules, :jsonb, null: false, default: []
  end
end
