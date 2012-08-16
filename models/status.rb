
class Status
  UNKNOWN = 0
  SUCCESS = 1
  FAILING = 2


  def Status.all
    [["Unknown", Status::UNKNOWN], ["Success", Status::SUCCESS], ["Failing", Status::FAILING]]
  end

  def Status.to_name(value)
    if !value.nil?
      case
      when value == Status::UNKNOWN
        "Unknown"
      when value == Status::SUCCESS
        "Success"
      when value == Status::FAILING
        "Failing"
      else
        raise ArgumentError, "Status not found. Value '#{value}' is out of range."
      end
    end
  end
end
