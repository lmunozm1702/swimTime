# frozen_string_literal: true

class ChangeStartFromTimeToDatatime < ActiveRecord::Migration[7.0]
  def change
    # change the start column type from time to datetime
    remove_column :races, :start, :time
    remove_column :races, :end, :time

    add_column :races, :start_datetime, :datetime
    add_column :races, :end_datetime, :datetime
  end
end
