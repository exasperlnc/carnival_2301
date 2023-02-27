require_relative 'visitor'
class Ride
  attr_reader :name, :min_height, :admission_fee, :excitement, :total_revenue, :rider_log
  def initialize(info)
    @name = info[:name]
    @min_height = info[:min_height]
    @admission_fee = info[:admission_fee]
    @excitement = info[:excitement]
    @total_revenue = 0
    @rider_log = {}
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

end