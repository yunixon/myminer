class CreateHashSpeeds < ActiveRecord::Migration
  def change
    create_table :hash_speeds do |t|
      t.string :speed

      t.timestamps
    end
  end
end
