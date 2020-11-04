class ClipsController < ApplicationController
  def create
    current_user.clips.create!(house_id: params[:house_id])
    @house= House.find(params[:house_id])
  end

  def destroy
    current_user.clips.find_by(house_id: params[:house_id]).destroy!
    @house= House.find(params[:house_id])
  end
end