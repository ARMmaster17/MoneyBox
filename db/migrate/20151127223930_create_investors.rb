class CreateInvestors < ActiveRecord::Migration
  def change
    create_table :investors do |t|
      t.string :user_name
      t.string :password
      t.string :image_path
      t.integer :money

      t.timestamps null: false
    end
  end
end
