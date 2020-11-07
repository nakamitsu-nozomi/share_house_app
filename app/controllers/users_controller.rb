class UsersController < ApplicationController
  def show
    @user=User.find(current_user.id)
    @houses = House.where(user_id: current_user.id)
    @clips= @user.cliped_houses
    @comments= Comment.where(user_id: current_user.id)
  end
  def clips
    @user=User.find(current_user.id)
    @houses= current_user.cliped_houses
    @myhouse=House.where(user_id: current_user.id)
    @comments= Comment.where(user_id: current_user.id)
  end

  def comments
    @user = User.find(current_user.id)
    @houses = current_user.comments_houses
    @myhouse = House.where(user_id: current_user.id)
    @cliphouse = current_user.cliped_houses
  end


  
end
