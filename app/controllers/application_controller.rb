class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_house_search_query
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_icon])
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_icon])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:adress])
    devise_parameter_sanitizer.permit(:account_update, keys: [:adress])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:experience])
    devise_parameter_sanitizer.permit(:account_update, keys: [:experience])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:experience])
    devise_parameter_sanitizer.permit(:account_update, keys: [:experience])
  end
  def set_house_search_query
    @q = House.ransack(params[:q])
    @houses= @q.result(distinct: true)
    @areas=Area.all
  end

  def check_guest
    email = resource&.email || params[:user][:email].downcase
    if email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの変更・削除はできません。'
    end
  end
  
end
