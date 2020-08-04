<p align="center">
  <img width="335" alt="mediask_logo_big" src="https://user-images.githubusercontent.com/61373915/89238708-edd32200-d631-11ea-95c0-fb5556f54b57.png">
</p>

# Name
MEDIASK

# Overview
オンライン問診票（薬局用）
Medical（医療の） + Ask（尋ねる）という意味の造語。

# Description
- 患者情報・問診票をペーパーレスで簡単に入力することができる。
- 患者モードでは、問診票の入力と過去の自己の問診票を閲覧可能。
- 管理者モードでは、全ての患者の情報が閲覧可能。

# DEMO
<img width="400" alt="meadiask_sample_1" src="https://user-images.githubusercontent.com/61373915/89240638-b23b5680-d637-11ea-863b-807108b11461.png">
<br>ログイン画面
<img width="400" alt="mediask_sample_2" src="https://user-images.githubusercontent.com/61373915/89240698-da2aba00-d637-11ea-9ea2-d1788f30222a.png">
<br>問診票登録画面
<img width="400" alt="mediask_sample_3" src="https://user-images.githubusercontent.com/61373915/89240700-dac35080-d637-11ea-960a-8fe0b83b88a4.png">
<br>管理者画面

# Requirement
- ruby 2.5.1p57
- Rails 5.0.7.2

# Usage
## URL
https://medi-ask.herokuapp.com/
## テスト用アカウント（患者用）
- ID: test1
- email: test1@test1.com
- pass: test1test1
## テスト用アカウント（管理者用）
- ID: admin
- email: admin@admin.com
- pass: adminadmin


# DB設計
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

 
# Author
- 作成者: asako mitsuyama
- E-mail: o70.mitsuyama.asako@gmail.com
