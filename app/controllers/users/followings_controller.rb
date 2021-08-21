# frozen_string_literal: true

class Users::FollowingsController < ApplicationController
  def index
    @title = 'Followings'
    @user = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end
end
