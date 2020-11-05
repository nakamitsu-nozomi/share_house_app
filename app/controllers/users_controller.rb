class UsersController < ApplicationController
  def show
    @user=User.find(current_user.id)
    @houses = House.where(user_id: current_user.id)
    @clips= @user.cliped_houses
  end
  def clips
    @user=User.find(current_user.id)
    @houses= current_user.cliped_houses
  end
  
end
