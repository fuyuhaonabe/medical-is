class ChangeDataBirthToProfiles < ActiveRecord::Migration[5.0]
  def change
    # 環境ごとにマイグレーションを分ける
    if Rails.env.development? || Rails.env.test?
      change_column :profiles, :birth, :date
    else Rails.env.production?
      # 本番環境はusingオプションを追加
      change_column :profiles, :birth, 'date USING CAST(birth AS date)'
    end
  end
end
