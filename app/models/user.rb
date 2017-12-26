class User < ApplicationRecord

  has_many :comments, as: :commentable

  has_one :profile, dependent: :destroy, inverse_of: :user
  accepts_nested_attributes_for :profile
  has_one :beer, through: :profile, as: :beer
  has_one :cat, through: :profile, as: :cat
  has_one :color, through: :profile, as: :color
  has_one :food, through: :profile, as: :food


  # Define the interest initiator
  has_many :initiated_interests, class_name: :Interested, foreign_key: :interester_id, dependent: :destroy
  has_many :interestees, through: :initiated_interests, source: :interestee

  # Define the interest recipient
  has_many :received_interests, class_name: :Interested, foreign_key: :interestee_id, dependent: :destroy
  has_many :suitors, through: :received_interests, source: :suitor

  validates :name, presence: true

  def mutual_interests
    pool = self.interestees
    mutuals = Interested.where('interester_id IN (?) AND interestee_id = ?', pool.pluck(:id), self.id)
    User.where('id IN (?)', mutuals.pluck(:interester_id))
    # pool.joins('JOIN interesteds ON users.id = interesteds.interester_id')
  end

end
