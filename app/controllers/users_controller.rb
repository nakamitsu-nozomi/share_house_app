class UsersController < ApplicationController
  before_action :authenticate_user!
    PER_PAGE =5
  def show
    @user=User.find(current_user.id)
    @houses = House.where(user_id: @user.id).page(params[:page]).per(PER_PAGE)
    @clips= @user.cliped_houses
    @comments= Comment.where(user_id: @user.id)
    @houses_count = House.where(user_id: @user.id)
    @clips_count= @user.cliped_houses
    @comments_count= Comment.where(user_id: @user.id)
  end
  def clips
    @user=User.find(current_user.id)
    @houses = House.where(user_id: current_user.id)
    @comments= Comment.where(user_id: current_user.id)
    @clips= @user.cliped_houses.page(params[:page]).per(PER_PAGE)
    @houses_count = House.where(user_id: current_user.id)
    @comments_count= Comment.where(user_id: current_user.id)
    @clips_count= @user.cliped_houses

  end

  def comments
    @user=User.find(current_user.id)
    @houses = House.where(user_id: current_user.id)
    @comments= current_user.comments_houses.page(params[:page]).per(PER_PAGE)
    @clips= @user.cliped_houses
    @houses_count = House.where(user_id: current_user.id)
    @comments_count= current_user.comments_houses
    @clips_count= @user.cliped_houses
  end


  
end
