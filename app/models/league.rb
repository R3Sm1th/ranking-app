class League < ApplicationRecord
  has_many :rounds, dependent: :destroy
end
