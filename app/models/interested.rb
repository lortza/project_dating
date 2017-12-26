class Interested < ApplicationRecord

  belongs_to :interestee, foreign_key: :interestee_id, class_name: :User

  belongs_to :suitor, foreign_key: :interester_id, class_name: :User

  validates :interestee_id,
            :uniqueness => { :scope => :interester_id }

end
