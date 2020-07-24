class AddMedicalHistoryEtcToInterviews < ActiveRecord::Migration[5.0]
  def change
    add_column :interviews, :medical_history_etc, :string
  end
end
