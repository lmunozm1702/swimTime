class Proof < ApplicationRecord
  has_many :races

  enum style: {
         freestyle: 0,
         backstroke: 1,
         breaststroke: 2,
         butterfly: 3,
         medley: 4
       }
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
         meters_7500: 11,
         meters_10000: 12,
         meters_4x1250: 13
       }
end
