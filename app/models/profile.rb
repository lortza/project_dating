class Profile < ApplicationRecord
  belongs_to :user, inverse_of: :profile
  belongs_to :color
  belongs_to :beer
  belongs_to :food
  belongs_to :cat
end
