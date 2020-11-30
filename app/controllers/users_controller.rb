class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
    PER_PAGE =5
  def show
    @houses = House.where(user_id: @user.id).page(params[:page]).per(PER_PAGE)
    @clips= @user.cliped_houses
    @comments= Comment.where(user_id: @user.id)
    @houses_count = House.where(user_id: @user.id)
    @clips_count= @user.cliped_houses
    @comments_count= Comment.where(user_id: @user.id)
  end
  def clips
    @houses = House.where(user_id: @user.id)
    @comments= Comment.where(user_id: @user.id)
    @clips= @user.cliped_houses.page(params[:page]).per(PER_PAGE)
    @houses_count = House.where(user_id: @user.id)
    @comments_count= Comment.where(user_id: @user.id)
    @clips_count= @user.cliped_houses

  end

  def comments
    @houses = House.where(user_id: @user.id)
    @comments= @user.comments_houses.page(params[:page]).per(PER_PAGE)
    @clips= @user.cliped_houses
    @houses_count = House.where(user_id: @user.id)
    @comments_count= @user.comments_houses
    @clips_count= @user.cliped_houses
  end

  private
  def set_user
    @user=User.find(current_user.id)
  end

  
end
