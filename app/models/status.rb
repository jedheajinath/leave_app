class Status < ActiveRecord::Base
  # establish_connection "staging"
  belongs_to :leave
  validates :status, presence: true

  include Statusable
end
