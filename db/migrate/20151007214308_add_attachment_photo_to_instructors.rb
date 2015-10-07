class AddAttachmentPhotoToInstructors < ActiveRecord::Migration
  def self.up
    change_table :instructors do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :instructors, :photo
  end
end
