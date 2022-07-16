class FollowRelationshipsController < ApplicationController

  def create
    current_user.follow(current_user.id, params[:user_id])
    # puts current_user.id
    # puts params[:user_id]
  end

  # def destroy
  # end
end
