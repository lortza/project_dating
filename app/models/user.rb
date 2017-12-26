class User < ApplicationRecord

  has_one :profile, dependent: :destroy

  validates :name, presence: true

end
