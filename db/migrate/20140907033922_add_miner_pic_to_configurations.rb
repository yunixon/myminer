class AddMinerPicToConfigurations < ActiveRecord::Migration
  def change
    add_column :configurations, :miner_pic, :string
  end
end
