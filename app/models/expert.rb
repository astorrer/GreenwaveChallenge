class Expert < ApplicationRecord
  has_shortened_urls
  has_many :tags, dependent: :destroy
end
