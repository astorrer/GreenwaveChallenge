class Expert < ApplicationRecord
  has_many :tags, dependent: :destroy
end
