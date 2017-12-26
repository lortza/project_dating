class User < ApplicationRecord

  has_one :profile, dependent: :destroy, inverse_of: :user
  accepts_nested_attributes_for :profile

  validates :name, presence: true

end
