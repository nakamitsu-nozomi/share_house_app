class HousesController < ApplicationController
  before_action :authenticate_user!, except: [:index ,:show,:map,:room]
  before_action :set_house, only: %i[edit update destroy]
  before_action :house, only: %i[show map room ]
  before_action :if_not_admin,only: %i[edit update destroy new create ]
  before_action :set_comment, only: %i[show index ]
  PER_PAGE =5
  def index
    @q = House.ransack(params[:q])
    @houses= @q.result(distinct: true).page(params[:page]).per(PER_PAGE)
    @result=@q.result(distinct: true)
    @areas=Area.all
  end

  def show
    @facilities=Facility.all
    @with_facility_ids=HousesFacility.where(house_id:@house.id).pluck(:facility_id)
  end

  def new
    @house= House.new
    @house.rooms.build
  end

  def create
    @house=current_user.houses.build(house_params)
    if @house.save 
      redirect_to @house,notice: "物件を登録しました"
    else
      flash.now[:alert] ="入力内容に不備があります。確認してもう一度送信してください。"
      render :new
    end
  end

  def edit
  end

  def update
    if @house.update(update_house_params)
      redirect_to @house,notice: "更新しました"
    else
      flash.now[:alert] ="入力内容に不備があります。確認してもう一度送信してください。"
      render :edit    
    end
  end

  def destroy
   @house.destroy!
   redirect_to root_path,alert: "削除しました"
  end

  def admin_new
    @houses=House.all
  end

  def map
  end
  
  def room
  end
 

  private
  def house_params
    params.require(:house).permit(:name,:house_image,:house_rent,:service_fee,:station,:access,:house_size,:convenience,:content,:user_id,:area_id,:address,:latitude, :longitude,:kitchen,:refrigerator,:laundry,:dryer,:toilet,:shower,:bathroom, { facility_ids: [] }, rooms_attributes: [:room_num, :image,:size,:rent,:room_type,:vacancy]).merge(area_id: params[:house][:area_id])
  end

  def update_house_params
    params.require(:house).permit(:name,:house_image,:house_rent,:service_fee,:station,:access,:house_size,:convenience,:content,:user_id,:area_id,:address,:latitude, :longitude,:kitchen,:refrigerator,:laundry,:dryer,:toilet,:shower,:bathroom, { facility_ids: [] }, rooms_attributes: [:room_num, :image,:size,:rent,:room_type,:vacancy,:_destroy, :id]).merge(area_id: params[:house][:area_id])
  end
  
  def set_house
   @house = House.find_by(id:params[:id])
    if @house.user_id != current_user.id
      flash[:notice] = "権限がありません"
      redirect_to root_path
    end
  end

  def house
   @house = House.find(params[:id])
     @rooms=Room.where(house_id: @house.id)
  end


  def if_not_admin
    redirect_to root_path  unless current_user.admin?
  end
  
  def set_comment
    @comments=Comment.where(house_id: @house)
  end



end
