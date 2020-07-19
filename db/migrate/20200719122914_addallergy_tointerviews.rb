class AddallergyTointerviews < ActiveRecord::Migration[5.0]
  def change
    add_column :interviews, :allergy, :string
  end
end
