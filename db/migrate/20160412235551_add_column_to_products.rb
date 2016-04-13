class AddColumnToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :desa, :string
  	add_column :products, :kecamatan, :string
  	add_column :products, :kabupaten, :string
  	add_column :products, :no_akte, :string
  end
end
