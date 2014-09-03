class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|
      t.string :nick
      t.integer :hw_type_id
      t.string :hw_name
      t.string :mb
      t.string :driver
      t.string :miner
      t.text   :config
      t.timestamps
    end
  end
end
