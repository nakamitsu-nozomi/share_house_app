class ClipsController < ApplicationController
  def create
    current_user.clips.create!(house_id: params[:house_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.clips.find_by(house_id: params[:house_id]).destroy!
    redirect_back(fallback_location: root_path)
  end
end