# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :following_relationships, class_name: :FollowRelationship, foreign_key: :follower_id, dependent: :destroy
  has_many :followings, through: :following_relationships, source: :followed

  has_many :followed_relationships, class_name: :FollowRelationship, foreign_key: :followed_id, dependent: :destroy
  has_many :followers, through: :followed_relationships, source: :follower

  def follow(follower_id, followed_id)
    FollowRelationship.create(follower_id:follower_id, followed_id:followed_id)
  end

  def unfollow(follower_id, followed_id)
    FollowRelationship.where(follower_id: follower_id, followed_id: followed_id).delete_all
  end

  def followed?(follower_id, followed_id)
    FollowRelationship.where(follower_id: follower_id, followed_id: followed_id).exists?
  end

end
