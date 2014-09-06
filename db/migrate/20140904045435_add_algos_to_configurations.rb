class AddAlgosToConfigurations < ActiveRecord::Migration
  def change
    add_column :configurations, :algo_type_id, :integer
  end
end
