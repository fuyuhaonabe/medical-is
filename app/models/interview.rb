class Interview < ApplicationRecord
  validates :generic,
  presence: true

  belongs_to :profile
  belongs_to :user
end
