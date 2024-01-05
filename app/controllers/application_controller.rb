class ApplicationController < ActionController::Base
  before_action :search
  before_action :configure_permitted_parameters, if: :devise_controller?

  def search
    @q = Post.ransack(params[:q])
    @search_items = @q.result(distinct: true).order(created_at: "DESC").includes(:user)
  end
  
  protected
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
