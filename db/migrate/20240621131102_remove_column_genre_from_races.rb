class RemoveColumnGenreFromRaces < ActiveRecord::Migration[7.0]
  def change
    remove_column :races, :genre, :integer
  end
end
