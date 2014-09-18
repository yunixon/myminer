class CreateRigs < ActiveRecord::Migration
  def change
    create_table :rigs do |t|
      t.string :name
      t.string :photo
      t.boolean :published

      t.timestamps
    end
  end
end
