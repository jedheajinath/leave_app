class Leave < ActiveRecord::Base
  belongs_to :user
  has_one :status, dependent: :destroy
  validates :from_date, :to_date, :reason,  presence: true

  def get_leaves_day
    sunday, saturday = 0, 6
    weekend = [sunday, saturday]
    count = ((self.from_date..self.to_date).collect(&:wday) - weekend).count
    return count
  end

  # def to_date=(str)
  #   to_date = Date.strptime(str, "%m/%d/%Y").strftime('%Y/%m/%d')
  #   logger.info "--------------#{to_date}"
  # end

  # def from_date=(str)
  #   form_date = Date.strptime(str, "%m/%d/%Y").strftime('%Y/%m/%d')
  #   logger.info "------------- #{form_date}"
  # end
end
