class CreateInterviews < ActiveRecord::Migration[5.0]
  def change
    create_table :interviews do |t|
      t.references :user, foreign_key: true
      t.references :profile, foreign_key: true
      t.string :diagnosis
      t.string :se_medicine
      t.string :se_symptom
      t.string :allergy
      t.string :medical_history
      t.string :medical_history_etc
      t.string :supplement
      t.string :life_details
      t.string :drinking
      t.string :smoking
      t.string :dosage_form
      t.string :pregnancy
      t.string :breastfeeding
      t.string :child_weight
      t.string :generic, null: false
      t.timestamps
    end
  end
end
