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
  end

  def update
  end

  def destroy
  end
  private
  def room_params
    params.permit(:room_num,:vacancy,:image,:size,:rent,:room_type)
  end
end
