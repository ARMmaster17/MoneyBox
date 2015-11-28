class RemoveStockFromCompany < ActiveRecord::Migration
  def change
    remove_column :companies, :stock, :string
    add_column :companies, :stock, :integer
  end
end
