# README

# medical-is DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null: false|
|email|string|null: false|
### Association
- has_many :interviews
- has_one :profile

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth|string|null: false|
|sex|string||
|zip_code|string||
|prefecuture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string||
|telephone_number|string|
### Association
- belongs_to :user
- has_many :interviews

## interviewsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|profile_id|integer|foreign_key: true|
|diagnosis|string||
|se_medicine|string||
|se_symptom|string||
|allergy|string||
|medical_history|string||
|medical_history_etc|string||
|supplement|string||
|life_details|string||
|drinking|string||
|smoking|string||
|dosage_form|string||
|pregnancy|string||
|breastfeeding|string||
|child_weight|string||
|generic|string|null: false|
### Association
- belongs_to :user
- belongs_to :profile
