class RemoveColumnProofsIdFromRaces < ActiveRecord::Migration[7.0]
  def change
    remove_column :races, :proofs_id
  end
end
