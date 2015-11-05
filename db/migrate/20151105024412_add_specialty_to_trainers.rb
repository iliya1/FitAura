class AddSpecialtyToTrainers < ActiveRecord::Migration
  def change
    add_column :trainers, :specialty, :string
  end
end
