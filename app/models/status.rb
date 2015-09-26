class Status < ActiveRecord::Base
  # establish_connection "staging"
  belongs_to :leave
  validates :status, presence: true
  validates :status, inclusion: { in: ["Pending", "Approved", "Rejected"] }

  include Statusable
end
