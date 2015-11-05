class AddExperienceToTrainers < ActiveRecord::Migration
  def change
    add_column :trainers, :years_of_experience, :string
  end
end
