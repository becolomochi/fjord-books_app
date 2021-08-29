# frozen_string_literal: true

class Users::FollowersController < ApplicationController
  def index
    @title = 'Followers'
    @user = User.with_attached_avatar.find(params[:user_id])
    @users = @user.followers
  end
end
