class Expert < ApplicationRecord
  #has_shortened_urls
  has_many :tags, dependent: :destroy

  has_many :friendships
  has_many :friends, through: :friendships, :source => :expert

  after_destroy do |f|
    Friendships.where(expert_id => f.expert_id).destroy unless nil?
  end
end
