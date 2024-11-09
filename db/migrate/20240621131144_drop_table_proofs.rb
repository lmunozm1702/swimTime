# frozen_string_literal: true

class DropTableProofs < ActiveRecord::Migration[7.0]
  def change
    drop_table :proofs
  end
end
