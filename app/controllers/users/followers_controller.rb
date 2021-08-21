# frozen_string_literal: true

class Users::FollowersController < ApplicationController
  def index
    @title = 'Followers'
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end
end
