class League < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :posts
  has_many :rounds, dependent: :destroy
end
