class friendship < ApplicationRecord
  belongs_to :expert, :foreign_key => :friend_id

  # Look for the inverse expert object and add as a friend.
  after_create do |f|
    if !Friendship.find(:first, :conditions => {:friend_id => f.expert_id})
      Friendship.create!(:expert_id => f.friend_id, :friend_id => f.expert_id)
    end
  end

  # Look for the inverse expert object and remove as a friend.
  after_destroy do |f|
    inverse = Friendship.find(:first, :conditions => {:friend_id => f.expert_id})
    inverse.destroy unless inverse.nil?
  end

  # ORM Notes
  # expert.friends returns an array of friends.
  # expert.friendship returns details about a specific relationship.

end
