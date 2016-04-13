class ChangeColumnToProducts < ActiveRecord::Migration
  def change
  	change_column :products, :alamat_lengkap, :string
  end
end
