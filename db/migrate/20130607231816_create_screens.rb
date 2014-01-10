class CreateScreens < ActiveRecord::Migration
  def change
    create_table :screens do |t|
      t.string :name
      t.string :base
      t.text :notes
      t.integer :user_id
      t.boolean :approved
      t.boolean :enabled

      t.timestamps
    end
  end
end
