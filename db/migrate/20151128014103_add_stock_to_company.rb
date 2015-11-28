class AddStockToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :stock, :string
  end
end
