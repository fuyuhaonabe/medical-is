class ProfilesController < ApplicationController
  def new
    @user = current_user
    @profiles = Profile.new
  end

  def create
  end
end
