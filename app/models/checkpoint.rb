# frozen_string_literal: true

class Checkpoint < ApplicationRecord
  belongs_to :race, dependent: :destroy
end
