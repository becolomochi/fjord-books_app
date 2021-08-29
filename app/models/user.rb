# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :active_relationships, inverse_of: 'follower', class_name: 'FollowRelationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationships, inverse_of: 'followed', class_name: 'FollowRelationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  # ユーザーをフォロー
  def follow(other_user)
    followings << other_user
  end

  # ユーザーをフォロー解除
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # 現在のユーザーがフォローしているかどうかの判定
  def following?(other_user)
    followings.include?(other_user)
  end
end
