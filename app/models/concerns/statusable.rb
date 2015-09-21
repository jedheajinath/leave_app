module Statusable
  extend ActiveSupport::Concern

  included do
    scope :pending_leaves, ->{ where(status: "Pending")}
  end

  class_methods do

    def get_pending_leaves
      array = []
      pending_leaves.each do |status|
        array << status.leave
      end
      return array
    end

  end

end