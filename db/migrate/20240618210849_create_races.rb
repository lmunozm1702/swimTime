class CreateRaces < ActiveRecord::Migration[7.0]
  def change
    create_table :races do |t|
      t.time :start
      t.time :end
      t.integer :pool_type
      t.integer :genre
      t.integer :proof_type

      t.timestamps
    end
  end
end
