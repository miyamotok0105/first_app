class CreateProducts2s < ActiveRecord::Migration
  def change
    create_table :products2s do |t|
      t.string :code
      t.string :name
      t.string :name_kana
      t.integer :price
      t.integer :purchase_cost
      t.boolean :availability
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
