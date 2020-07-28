class InterviewsController < ApplicationController
  before_action :medical_history_string, only: [:create, :update]
  before_action :life_details_string, only: [:create, :update]
  before_action :dosage_form_string, only: [:create, :update]

  def index
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = Interview.new(interview_params)
    unless @interview.valid?
      render :new and return
    end
    @interview.save
    redirect_to  complete_interviews_path and return
  end

  def show
    # @user = current_user
    # @profile = Profile.find(params[:id])
    @profile = Profile.find_by(user_id: current_user.id)
    @interviews = Interview.find(params[:id])
  end

  def medical_history_string
    if params[:interview][:medical_history].present?
      params[:interview][:medical_history] = params[:interview][:medical_history].join("、")
    end
  end

  def life_details_string
    if params[:interview][:life_details].present?
      params[:interview][:life_details] = params[:interview][:life_details].join("、")
    end
  end

  def dosage_form_string
    if params[:interview][:dosage_form].present?
      params[:interview][:dosage_form] = params[:interview][:dosage_form].join("、")
    end
  end

  def complete
  end

  def mypage
    @user = current_user
    @profile = Profile.find_by(user_id: current_user.id)
    @interviews = Interview.where(user_id:current_user.id).order("created_at DESC")
  end

  def adminpage
    if user_signed_in? && current_user.id == 1
      @user = User.joins(:interviews, :profile).order("created_at DESC").page(params[:page]).per(13)
      # @interview = Interview.all.order("created_at DESC")
    else
      redirect_to root_path
    end
  end

  def search
    if user_signed_in? && current_user.id == 1
      if params[:first_name].present?
        @user = User.where('name LIKE ?', "%#{params[:first_name]}%").joins(:interviews, :profile).order("created_at DESC").page(params[:page]).per(13)
      else
        @users = User.none
      end
    else
      redirect_to root_path
    end
  end

  private

  def interview_params
    params.require(:interview).permit(
      :diagnosis, 
      :se_medicine,
      :se_symptom,
      :allergy,
      :supplement,
      :drinking,
      :smoking,
      :pregnancy,
      :breastfeeding,
      :child_weight,
      :generic,
      :dosage_form,
      :life_details,
      :medical_history,
      :medical_history_etc).merge(user_id: current_user.id)
  end



end
