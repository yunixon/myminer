class AddHashrateToConfigurations < ActiveRecord::Migration
  def change
    add_column :configurations, :hashrate, :decimal
  end
end
