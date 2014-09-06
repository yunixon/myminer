class CreateAlgoTypes < ActiveRecord::Migration
  def change
    create_table :algo_types do |t|
      t.string :name
    end
  end
end
