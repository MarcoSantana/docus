class AddAttachmentLogoToUniversities < ActiveRecord::Migration
  def self.up
    change_table :entities do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :universities, :logo
  end
end
