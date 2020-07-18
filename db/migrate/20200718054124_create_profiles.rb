class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :family_name, null: false
      t.string :first_name, null: false
      t.string :family_name_kana, null: false
      t.string :first_name_kana, null: false
      t.string :birth, null: false
      t.string :sex
      t.string :zip_code
      t.string :prefecuture, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building_name
      t.string :telephone_number
      t.timestamps
    end
  end
end
