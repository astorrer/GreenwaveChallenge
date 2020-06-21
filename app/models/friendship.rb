class Friendship < ApplicationRecord
  belongs_to :expert, :foreign_key => :friend_id

  after_save do |f|
    # Friendships records are created with expert_id and friend_id
    # After save, create another record between friend_id and expert_id

    # Make sure than a relationship between the two friends doesn't already exist.
    unless Friendship.where(:expert_id => f.friend_id, :friend_id => f.expert_id).present?
      Friendship.create!(:expert_id => f.friend_id, :friend_id => f.expert_id)
    end
  end

  # Look for the inverse expert object and remove as a friend.
  after_destroy do |f|
    #inverse = Friendship.find(:first, :conditions => {:friend_id => f.expert_id})
    inverse = Friendship.where(:expert_id => f.friend_id, :friend_id => f.expert_id).first
    inverse.destroy unless inverse.nil?
  end

  # ORM Notes
  # expert.friends returns an array of friends.
  # expert.friendship returns details about a specific relationship.

end
