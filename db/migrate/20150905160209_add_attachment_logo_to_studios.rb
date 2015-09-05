class AddAttachmentLogoToStudios < ActiveRecord::Migration
  def self.up
    change_table :studios do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :studios, :logo
  end
end
