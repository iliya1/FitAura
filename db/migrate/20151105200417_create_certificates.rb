class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.integer :trainer_id
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end
