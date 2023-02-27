require_relative 'visitor'
class Ride
  attr_reader :name, :min_height, :admission_fee, :excitement, :total_revenue, :rider_log
  def initialize(info)
    @name = info[:name]
    @min_height = info[:min_height]
    @admission_fee = info[:admission_fee]
    @excitement = info[:excitement]
    @total_revenue = 0
    @rider_log = Hash.new(0)
  end

  def compare_excitement(visitor)
    visitor.excitement_check(@excitement)
  end

  def add_revenue
    @total_revenue += @admission_fee
  end

  def check_height(visitor)
    if visitor.height >= min_height
      return true
    else
      false
    end
  end

  def check_spending_money(visitor)
    if visitor.spending_money >= @admission_fee
      return true
    end
    false
  end

  def log_rider(visitor)
    @rider_log[visitor] += 1
  end

  def board_rider(visitor)
    if compare_excitement(visitor) && check_height(visitor) && check_spending_money(visitor)
      visitor.charge(@admission_fee)
      add_revenue
      log_rider(visitor)
      return visitor
    end
    false
  end
end