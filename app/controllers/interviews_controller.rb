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
    redirect_to  complete_interviews_path(@user) and return
  end

  def medical_history_string
    params[:interview][:medical_history] = params[:interview][:medical_history].join("、")  # to string
  end

  def life_details_string
    params[:interview][:life_details] = params[:interview][:life_details].join("、")  # to string
  end

  def dosage_form_string
    params[:interview][:dosage_form] = params[:interview][:dosage_form].join("、")  # to string
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

  def complete
  end

end
