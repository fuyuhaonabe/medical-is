class Interview < ApplicationRecord

  belongs_to :user
  belongs_to :profile

  validates :generic,
  presence: true


end
