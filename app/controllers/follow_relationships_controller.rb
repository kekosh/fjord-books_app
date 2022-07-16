class FollowRelationshipsController < ApplicationController

  def create
    current_user.follow(current_user.id, params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(current_user.id, params[:user_id])
    redirect_to request.referer
  end
end
