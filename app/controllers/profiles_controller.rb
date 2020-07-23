class ProfilesController < ApplicationController
  def new
    @profiles = Profile.new
  end

  def create
    @profiles = Profile.new(prorifle_params)
    unless @profiles.valid?
      render :new and return
    end
    @profiles.save
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
