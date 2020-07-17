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

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
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
|telephone_number|string|null: false|

## interviewsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|diagnosis|string||
|se_medicine|string||
|se_symptom|string||
|medical_history|string||
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
