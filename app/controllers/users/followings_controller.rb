# frozen_string_literal: true

class Users::FollowingsController < ApplicationController
  def index
    @title = 'Followings'
    @user = User.find(params[:user_id])
    @users = @user.followings.with_attached_avatar
  end
end
