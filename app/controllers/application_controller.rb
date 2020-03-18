class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user
  before_action :set_building, only: [:new, :edit, :create]
  before_action :set_departments_array, only: [:new, :edit, :create]
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

  def set_departments_array
    if current_user != nil 
      if current_user.user_type_id == 1
        @department_array = Department.order(:num_dep).pluck(:num_dep, :id)
      else
        @department_array = Department.where(building_id: current_user.building_id).pluck(:num_dep, :id)
      end
    end
  end

  def set_concepts_array
    if current_user != nil 
      if current_user.user_type_id == 1
        @concept_array = Concept.order(:name).pluck(:name, :id)
      else
        @concept_array = Concept.where(building_id: current_user.building_id).pluck(:name, :id)
      end
    end
  end

end
