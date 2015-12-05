class Exercise < ActiveRecord::Base
  belongs_to :user
  validates :duration_in_min, presence: true
  validates_numericality_of :duration_in_min, only_integer: true
  validates :workout_details, presence: true
  validates :workout_date, presence: true
  validates :user_id, presence: true

end
