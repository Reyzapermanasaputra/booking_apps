class ChangeColumnToProduct < ActiveRecord::Migration
  def change
  	rename_column :products, :name, :nama_lembaga
  	rename_column :products, :price, :alamat_lengkap
  end
end
