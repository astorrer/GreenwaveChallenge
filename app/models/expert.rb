class Expert < ApplicationRecord
  #has_shortened_urls
  has_many :tags, dependent: :destroy

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, :source => :expert

  after_destroy do |f|
    if Friendship.where(:expert_id => f.friend_id, :friend_id => f.expert_id).present?
      Friendship.destroy(:expert_id => f.friend_id, :friend_id => f.expert_id)
    end
  end
end
