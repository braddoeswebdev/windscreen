class AddAttachmentGraphicToFlashers < ActiveRecord::Migration
  def self.up
    change_table :flashers do |t|
      t.attachment :graphic
    end
  end

  def self.down
    drop_attached_file :flashers, :graphic
  end
end
