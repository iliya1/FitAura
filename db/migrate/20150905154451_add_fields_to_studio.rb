class AddFieldsToStudio < ActiveRecord::Migration
  def change
    add_column :studios, :phone, :string
    add_column :studios, :address1, :string
    add_column :studios, :address2, :string
  end
end
