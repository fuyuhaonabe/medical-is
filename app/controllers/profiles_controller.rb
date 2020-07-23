class ProfilesController < ApplicationController
  def new
    @profile = Profile.new(profile_params)
  end

  def create
    @profile = Profile.new(profile_params)
    unless @profile.valid?
      render :new and return
    end
    @profile.save
    redirect_to  new_interview_path(@user) and return
  end

  private

  def profile_params
    params.require(:profile).permit(
      :family_name, 
      :first_name,
      :family_name_kana,
      :first_name_kana,
      :birth,
      :sex,
      :zip_code,
      :prefecuture,
      :city,
      :address,
      :building_name,
      :telephone_number).merge(user_id: current_user.id)
  end
end
