class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :ticker_name
      t.integer :quantity
      t.integer :value
      t.references :owner, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
