class Status < ActiveRecord::Base
  # establish_connection "staging"
  belongs_to :leave
  validates :status, presence: true

  include Statusable

  # scope :pending_leaves, ->{ where(status: "Pending")}

  # def self.get_pending_leaves
  #   array = []
  #   pending_leaves.each do |status|
  #     array << status.leave
  #   end
  #   return array
  # end
end
