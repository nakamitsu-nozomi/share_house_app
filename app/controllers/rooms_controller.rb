class RoomsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @room=Room.new
  end

  def create
    @house=House.find(params[:house_id])
    @room=Room.new(room_params)
    @room.house_id=@house.id
    if @room.save 
      redirect_to @house,notice: "部屋情報を登録しました"
    else
      flash.now[:alert] ="投稿に失敗しました"
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
      redirect_to room_house_path(@house),notice: "更新しました"
    else
      flash.now[:alert] ="更新に失敗しました"
      render :edit    
    end
  end

  def destroy
    @house=House.find(params[:house_id])
    @room= Room.find_by(house_id: params[:house_id],id: params[:id])
    @room.destroy!
    redirect_to room_house_path(@house),alert: "削除しました"
  end
  private
  def room_params
    params.permit(:room_num,:vacancy,:image,:size,:rent,:room_type)
  end
  def update_room_params
    params.require(:room).permit(:room_num,:vacancy,:image,:size,:rent,:room_type)
  end
end
