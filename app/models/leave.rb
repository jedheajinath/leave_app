class Leave < ActiveRecord::Base
  # establish_connection "staging"
  belongs_to :user
  has_one :status, dependent: :destroy

  validates_with DateValidator
  validates :reason, presence: true

  def get_leaves_day
    sunday, saturday = 0, 6
    weekend = [sunday, saturday]
    count = ((self.from_date..self.to_date).collect(&:wday) - weekend).count
    return count
  end
end
