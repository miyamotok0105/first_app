class CreateIbentos < ActiveRecord::Migration
  def change
    create_table :ibentos do |t|
      t.string :ibento
      t.date :kaisaibi
      t.datetime :kaisaijikan
      t.integer :price
      t.string :basho

      t.timestamps
    end
  end
end
