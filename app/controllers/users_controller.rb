class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user=User.find(current_user.id)
    @houses = House.where(user_id: current_user.id)
    @clips= @user.cliped_houses
    @comments= Comment.where(user_id: current_user.id)
  end
  def clips
    @user=User.find(current_user.id)
    @houses = House.where(user_id: current_user.id)
    @comments= Comment.where(user_id: current_user.id)
    @clips= @user.cliped_houses

  end

  def comments
    @user=User.find(current_user.id)
    @houses = House.where(user_id: current_user.id)
    @comments= current_user.comments_houses
    @clips= @user.cliped_houses
  end


  
end
