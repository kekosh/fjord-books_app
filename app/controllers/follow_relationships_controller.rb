class FollowRelationshipsController < ApplicationController

  def create
    puts current_user.id
    puts params[:user_id]
  end

  def destroy
  end
end
