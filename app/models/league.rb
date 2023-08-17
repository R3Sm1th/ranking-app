class League < ApplicationRecord
  has_many :rounds, dependent: :destroy
  has_many :users
end
