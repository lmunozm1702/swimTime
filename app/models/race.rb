class Race < ApplicationRecord
  has_many :checkpoints

  enum pool_type: { _25: 0, _50: 1 }, _prefix: true
  enum genre: { man: 1, woman: 2, mixed: 3 }
  enum proof_type: { individual: 0, relay: 1 }
  enum style: { freestyle: 0, backstroke: 1, breaststroke: 2, butterfly: 3, medley: 4 }
  enum distance: {
         meters_50: 0,
         meters_100: 1,
         meters_200: 2,
         meters_400: 3,
         meters_800: 4,
         meters_1500: 5,
         meters_4x50: 6,
         meters_4x100: 7,
         meters_4x200: 8,
         meters_3000: 9,
         meters_5000: 10,
       },
       _prefix: true
end
