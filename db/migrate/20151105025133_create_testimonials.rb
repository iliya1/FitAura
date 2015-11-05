class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.integer :trainer_id
      t.string :name
      t.text :testimonial

      t.timestamps null: false
    end
  end
end
