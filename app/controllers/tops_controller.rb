class TopsController < ApplicationController
  def index
    @q = House.ransack(params[:q])
    @houses= @q.result(distinct: true)
    @areas=Area.all
  end
end
