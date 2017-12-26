class Cat < ApplicationRecord

  has_many :comments, as: :commentable
  has_many :profiles

end
