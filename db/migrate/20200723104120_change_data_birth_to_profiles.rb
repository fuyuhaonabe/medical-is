class ChangeDataBirthToProfiles < ActiveRecord::Migration[5.0]
  def change
    change_column :profiles, :birth, :date
  end
end
