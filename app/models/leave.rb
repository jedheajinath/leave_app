class Leave < ActiveRecord::Base
  belongs_to :user
  has_one :status, dependent: :destroy

  # validates :from_date, :to_date, :reason,  presence: true
  validate :from_date_cannot_be_in_the_past
  validate :to_date_cannot_be_less_than_from_date

  def get_leaves_day
    sunday, saturday = 0, 6
    weekend = [sunday, saturday]
    count = ((self.from_date..self.to_date).collect(&:wday) - weekend).count
    return count
  end

  private
    def from_date_cannot_be_in_the_past
      if from_date < Date.today + 1
        errors.add(:from_date, "Can't in  Past or Todays Date")
      end
    end

    def to_date_cannot_be_less_than_from_date
      if to_date <= from_date || (to_date - from_date).to_i > 30
        errors.add(:to_date, "Must Greater than From date or
         Leave cant more than 30 days")
      end
    end
end
