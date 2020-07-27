class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if user_signed_in? && current_user.id == 1
      adminpage_interviews_path
    else
      @user = current_user
      @profile = Profile.find_by(user_id: current_user.id)
      if @profile.nil?
        new_profile_path(@user)
      else
        new_interview_path(@user)
      end
    end
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password])
  end
  
end
