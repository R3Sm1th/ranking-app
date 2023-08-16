class Round < ApplicationRecord
  belongs_to :league
  has_many :submissions
end
