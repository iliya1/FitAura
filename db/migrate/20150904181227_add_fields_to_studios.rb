class AddFieldsToStudios < ActiveRecord::Migration
  def change
    add_column :studios, :name, :string
    add_column :studios, :zipcode, :string
  end
end
