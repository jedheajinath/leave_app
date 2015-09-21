class Attendence < ActiveRecord::Base
  # serialize :attendance, Hash
  belongs_to :user

  def self.get_daywise_attendence(date = Date.today)
    user = []
    Attendence.where("attendence_date = ?", date).each do |attendence|
      user << attendence.user
    end
    return user
  end
end
