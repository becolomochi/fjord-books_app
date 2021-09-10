# frozen_string_literal: true

class Users::FollowersController < ApplicationController
  def index
    @title = 'Followers'
    @user = User.find(params[:user_id])
    @users = @user.followers.with_attached_avatar
  end
end
