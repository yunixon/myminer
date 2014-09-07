class AddGpuzPicToConfigurations < ActiveRecord::Migration
  def change
    add_column :configurations, :gpuz_pic, :string
  end
end
