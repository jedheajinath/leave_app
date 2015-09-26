class Attendence < ActiveRecord::Base
  # serialize :attendance, Hash
  belongs_to :user

  validates :attendence_date, presence: true
  validates :attendence, inclusion: { in: [true, false] }

  def self.get_daywise_attendence(date)
    user = []
    Attendence.where("attendence_date = ?", date).each do |attendence|
      user << attendence.user
    end
    return user
  end
end
