class AddHashSpeedToConfigurations < ActiveRecord::Migration
  def change
    add_column :configurations, :hash_speed_id, :integer
  end
end
