class Profile < ApplicationRecord
  belongs_to :user, inverse_of: :profile
  belongs_to :beer
  belongs_to :cat
  belongs_to :color
  belongs_to :food
end
