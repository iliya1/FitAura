class AddSetToTrainers < ActiveRecord::Migration
  def change
    add_column :trainers, :sex, :string
  end
end
