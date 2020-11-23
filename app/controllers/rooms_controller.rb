class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: %i[edit update destroy create new ]
  before_action :if_not_admin,only: %i[edit update destroy new create ]
  def new
    @room=Room.new
  end

  def create
    @house=House.find(params[:house_id])
    @room=Room.new(room_params)
    @room.house_id=@house.id
    if @room.save 
      redirect_to room_house_path(@house),notice: "部屋情報を登録しました"
    else
      flash.now[:alert] ="入力内容に不備があります。確認してもう一度送信してください。"
      render :new
    end
  end
  
  def edit
    @room = Room.find_by(house_id:params[:house_id],id:params[:id])
  end

  def update
    @house=House.find(params[:house_id])
    @room= Room.find_by(house_id: params[:house_id],id: params[:id])
    @room.house_id=@house.id
    if @room.update(update_room_params)
      redirect_to room_house_path(@house),notice: "更新しました。"
    else
      flash.now[:alert] ="入力内容に不備があります。確認してもう一度送信してください。"
      render :edit    
    end
  end

  def destroy
    @house=House.find(params[:house_id])
    @room= Room.find_by(house_id: params[:house_id],id: params[:id])
    @room.destroy!
    redirect_to room_house_path(@house),alert: "削除しました。"
  end
  private
  def room_params
    params.permit(:room_num,:vacancy,:image,:size,:rent,:room_type)
  end
  def update_room_params
    params.require(:room).permit(:room_num,:vacancy,:image,:size,:rent,:room_type)
  end

  def set_room
    @house=House.find(params[:house_id])
    if @house.user_id != current_user.id
      flash[:notice] = "権限がありません"
      redirect_to room_house_path(@house)
    end
  end

  def if_not_admin
    @house=House.find(params[:house_id])
    redirect_to room_house_path(@house)  unless current_user.admin?
  end
end
