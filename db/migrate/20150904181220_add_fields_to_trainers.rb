class AddFieldsToTrainers < ActiveRecord::Migration
  def change
    add_column :trainers, :name, :string
    add_column :trainers, :zipcode, :string
  end
end
