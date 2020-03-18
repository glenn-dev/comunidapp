class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user
  before_action :set_building, only: [:new, :edit, :create]
  before_action :set_department, only: [:new, :edit, :create]
  before_action :set_concepts_array, only: [:new, :edit, :create]
  before_action :authenticate_user!
    
  # helper_method :current_user

  protected

  def set_current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :user_type, :department_id])
  end

  private

  def set_building
    @building_array = Building.order(:name).pluck(:name, :id)
  end

  def set_department
    @department_array = Department.order(:num_dep).pluck(:num_dep, :id)
  end

  def set_concepts_array
    @concept_array = Concept.order(:name).pluck(:name, :id)
  end

end
