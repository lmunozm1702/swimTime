class Checkpoint < ApplicationRecord
  belongs_to :race, dependent: :destroy
end
