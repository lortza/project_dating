class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :color
  belongs_to :beer
  belongs_to :food
  belongs_to :cat
end
