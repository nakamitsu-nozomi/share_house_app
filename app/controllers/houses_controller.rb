class HousesController < ApplicationController
  before_action :authenticate_user!, except: [:index ,:show]
  before_action :set_house, only: %i[edit update destroy]

  def index
    @q = House.ransack(params[:q])
    @houses= @q.result(distinct: true)
    @areas=Area.all
  end

  def show
    @house=House.find(params[:id])
  end

  def new
    @house= House.new
  end

  def create
    @house =House.create(name: house_params[:name],house_image: house_params[:house_image],house_rent: house_params[:house_rent],service_fee: house_params[:service_fee],station: house_params[:station],access: house_params[:access],house_size: house_params[:house_size],convenience: house_params[:convenience],content: house_params[:content],user_id: current_user.id,area_id: house_params[:area_id])
    if @house.save
      redirect_to @house,notice: "物件を登録しました"
    else
      flash.now[:alert] ="投稿に失敗しました"
      render :new
    end
  end

  def edit
    @house = House.find(params[:id])
  end

  def update
    @house.update(house_params)
    if @house.update(house_params)
      redirect_to @house,notice: "更新しました"
    else
      flash.now[:alert] ="更新に失敗しました"
      render :edit    
    end
  end

  def destroy
   @house.destroy!
   redirect_to root_path,alert: "削除しました"
  end

  private
  def house_params
    params.require(:house).permit(:name,:house_image,:house_rent,:service_fee,:station,:access,:house_size,:convenience,:content,:user_id,:area_id)
  end
  
  def set_house
   @house = House.find_by(id:params[:id])
    if @house.user_id != current_user.id
      flash[:notice] = "権限がありません"
      redirect_to root_path
    end
  end

end
