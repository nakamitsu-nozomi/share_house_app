class ClipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_clip
  def create
    current_user.clips.create!(house_id: params[:house_id])
  end

  def destroy
    current_user.clips.find_by(house_id: params[:house_id]).destroy!
  end

  private
  def set_clip
    @house= House.find(params[:house_id])
    @myhouse=House.where(user_id: current_user.id)
    @comments= Comment.where(user_id: current_user.id)
  end
end