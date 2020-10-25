class UsersController < ApplicationController
  def show
    @user=User.find(current_user.id)
    @houses = House.where(user_id: current_user.id)
  end
end
