class FollowRelationshipsController < ApplicationController
  before_action :set_user, only: %i[followings followers]

  def create
    current_user.follow(current_user.id, params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(current_user.id, params[:user_id])
    redirect_to request.referer
  end

  def followings
    @users = @user.followings
    render 'show'
  end

  def followers
    @users = @user.followers
    render 'show'
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

end
