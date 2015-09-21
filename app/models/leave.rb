class Leave < ActiveRecord::Base
  # establish_connection "staging"
  belongs_to :user
  has_one :status, dependent: :destroy

  validates :from_date, :to_date, :reason,  presence: true
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
      if !from_date.nil?
        self.errors.clear
        errors.add(:from_date, "Can't in  Past or Todays Date") if
        from_date < Date.today + 1
      elsif valid_date?(from_date)
        errors.add(:from_date, "Date must in following Format dd/mm/yyyy")
      end
    end

    def to_date_cannot_be_less_than_from_date
      if !to_date.nil?
        self.errors.clear
        errors.add(:to_date, "Must Greater than From date or
        Leave cant more than 30 days") if
        to_date <= from_date || (to_date - from_date).to_i > 30
      elsif valid_date?(to_date)
        errors.add(:to_date, "Date must in following Format dd/mm/yyyy")
      end
    end

    def valid_date?(date,format = "%d/%m/%Y")
      begin
        Date.strptime(date,format)
        return false
      rescue
        return true
      end
    end
end



