class HousesController < ApplicationController
  before_action :authenticate_user!, except: [:index ,:show,:map,:room]
  before_action :set_house, only: %i[edit update destroy  ]
  before_action :if_not_admin,only: %i[edit update destroy new create ]

  def index
    @q = House.ransack(params[:q])
    @houses= @q.result(distinct: true)
    @areas=Area.all
    @comments=Comment.where(house_id: @house)
  
  end

  def show
    if params[:id].present? 
      @house=House.find(params[:id])
    else
      @house=House.find(params[:house_id])
    end
    @comments=Comment.where(house_id: @house)
    @facilities=Facility.all
    @with_facility_ids=HousesFacility.where(house_id:@house.id).pluck(:facility_id)
    @rooms=Room.where(house_id: @house.id)
  end

  def new
    @house= House.new
    @house.rooms.build
  end

  def create
    @house=current_user.houses.build(house_params)
    # @house =House.create(name: house_params[:name],house_image: house_params[:house_image],house_rent: house_params[:house_rent],service_fee: house_params[:service_fee],station: house_params[:station],access: house_params[:access],house_size: house_params[:house_size],convenience: house_params[:convenience],content: house_params[:content],user_id: current_user.id,area_id: house_params[:area_id],address: house_params[:address],kitchen: house_params[:kitchen],refrigerator: house_params[:refrigerator],laundry: house_params[:laundry],dryer: house_params[:dryer],toilet: house_params[:toilet],bathroom: house_params[:bathroom], shower: house_params[:shower])
    if @house.save 
      redirect_to @house,notice: "物件を登録しました"
    else
      flash.now[:alert] ="入力内容に不備があります。確認してもう一度送信してください。"
      render :new
    end
  end

  def edit
    @house = House.find(params[:id])
  end

  def update
    @house= House.find(params[:id])
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
    @house=House.find(params[:id])
    @comments=Comment.where(house_id: @house)
  end
  
  def room
     @house=House.find(params[:id])
     @rooms=Room.where(house_id: @house.id)
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

  def if_not_admin
    redirect_to root_path  unless current_user.admin?
  end



end
