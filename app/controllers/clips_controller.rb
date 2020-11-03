class ClipsController < ApplicationController
  def create
    @house= House.find(params[:house_id])
    current_user.clips.create!(house_id: @house.id)
  end

  def destroy
    @house= House.find(params[:house_id])
    current_user.clips.find_by(house_id: @house.id).destroy!
  end
end