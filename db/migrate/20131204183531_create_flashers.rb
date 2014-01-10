class CreateFlashers < ActiveRecord::Migration
  def change
    create_table :flashers do |t|
      t.string :name

      t.timestamps
    end
  end
end
