class CreateCheckpoints < ActiveRecord::Migration[7.0]
  def change
    create_table :checkpoints do |t|
      t.references :race, null: false, foreign_key: true
      t.datetime :start
      t.datetime :end
      t.datetime :arm_start
      t.datetime :arm_end
      t.float :arm_frequency
      t.float :arm_distance
      t.float :arm_speed
      t.float :elapsed_time

      t.timestamps
    end
  end
end
