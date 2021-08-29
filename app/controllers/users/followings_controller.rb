# frozen_string_literal: true

class Users::FollowingsController < ApplicationController
  def index
    @title = 'Followings'
    @user = User.with_attached_avatar.find(params[:user_id])
    @users = @user.followings
  end
end
