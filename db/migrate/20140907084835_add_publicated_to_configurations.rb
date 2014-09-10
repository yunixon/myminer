class AddPublicatedToConfigurations < ActiveRecord::Migration
  def change
    add_column :configurations, :publicated, :boolean
  end
end
