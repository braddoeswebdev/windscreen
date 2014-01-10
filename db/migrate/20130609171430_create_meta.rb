class CreateMeta < ActiveRecord::Migration
  def change
    create_table :meta do |t|
      t.string :key
      t.text :value

      t.timestamps
    end
  end
end
