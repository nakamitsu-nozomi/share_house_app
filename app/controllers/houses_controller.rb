class HousesController < ApplicationController
  def index

  end

  def show
  end

  def new
    @house= House.new
  end

  def create
    house =House.create!(house_params)
    redirect_to house
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def house_params
    params.require(:house).permmit(:name,:house_image,:house_rent,:service_fee,:station,:access,:house_size,:convenience,:content)
  end
end
