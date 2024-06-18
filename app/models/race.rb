class Race < ApplicationRecord
  belongs_to :proof

  enum pool_type: { meters_25: 0, meters_50: 1, open_water: 2 }
  enum genre: { man: 1, woman: 2, mixed: 3 }
  enum proof_type: { individual: 0, relay: 1 }
end
