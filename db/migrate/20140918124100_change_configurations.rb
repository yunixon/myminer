class ChangeConfigurations < ActiveRecord::Migration
  def change
    rename_column :configurations, :publicated, :published
  end
end
