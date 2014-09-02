class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|
      t.string :nick
      t.string :cpu
      t.string :motherboard
      t.string :video
      t.string :miner
      t.text   :config
      t.timestamps
    end
  end
end
