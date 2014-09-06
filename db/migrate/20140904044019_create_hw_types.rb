class CreateHwTypes < ActiveRecord::Migration
  def change
    create_table :hw_types do |t|
      t.string :name
    end
  end
end
