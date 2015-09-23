class Date_validator <  ActiveModel::Validator

  def validate(record)
    record.errors.clear
    if record.from_date.nil?
      record.errors[:from_date] << "cant empty"
    elsif record.to_date.nil?
      record.errors[:to_date] << "can't empty"
    elsif valid_date?(record.from_date)
      record.errors[:from_date] << "Invalid date format try (dd/mm/yyy)"
    elsif valid_date?(record.to_date)
      record.errors[:to_date] << "Invalid date format try (dd/mm/yyy)"
    elsif from_date_cannot_be_in_the_past?(record.from_date)
      record.errors[:from_date] << "Cant in Past or todays date"
    elsif to_date_cannot_be_less_than_from_date(record.from_date,record.to_date)
      record.errors[:to_date] << "must greater than Form date"
    elsif (record.from_date..record.to_date).count > 30
      record.errors[:to_date] << "Leave cant be greater than 30 days"
    end
  end

  private
    # check valid date format
    def valid_date?(date,format = "%d/%m/%Y")
      begin
        Date.strptime(date,format)
        return true
      rescue
        return false
      end
    end

    # check from date con't be dodays date or past date
    def from_date_cannot_be_in_the_past?(date)
      date <= Date.today ? true : false
    end

    # check to date cant less than from date
    def to_date_cannot_be_less_than_from_date(from_date, to_date)
      to_date < from_date ?  true : false
    end
end