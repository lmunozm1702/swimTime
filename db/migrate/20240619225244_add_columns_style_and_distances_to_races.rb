# frozen_string_literal: true

class AddColumnsStyleAndDistancesToRaces < ActiveRecord::Migration[7.0]
  def change
    add_column :races, :style, :integer
    add_column :races, :distance, :integer
  end
end
