class Expert < ApplicationRecord
  has_shortened_urls
  has_many :tags, dependent: :destroy

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, :source => :expert
end
