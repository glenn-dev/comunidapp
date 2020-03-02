class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_building, only: [:new, :edit, :create]
    before_action :set_department, only: [:new, :edit, :create]

  protected

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

end
