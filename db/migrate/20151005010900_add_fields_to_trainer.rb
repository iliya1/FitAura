class AddFieldsToTrainer < ActiveRecord::Migration
  def change
    add_column :trainers, :about, :text
    add_column :trainers, :phone, :string
  end
end
