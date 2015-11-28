class AddOwnerToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :owner, :integer
  end
end
