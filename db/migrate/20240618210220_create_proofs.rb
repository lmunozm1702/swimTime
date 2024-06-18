class CreateProofs < ActiveRecord::Migration[7.0]
  def change
    create_table :proofs do |t|
      t.integer :style
      t.integer :distance

      t.timestamps
    end
  end
end
