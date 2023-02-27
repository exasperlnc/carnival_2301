require_relative 'ride'
class Carnival
  attr_reader :name, :duration, :rides
  def initialize(info)
    @name = info[:name]
    @duration = info[:duration]
    @rides = []
  end
  
  def add_ride(ride)
    @rides << ride
  end

  def pop_ride
    most_pop_ride = []
    total_log = []
    @rides.each do |ride|
      total_log << ride.total_riders
    end
    @rides.each do |ride| 
      if ride.total_riders == total_log.max
        most_pop_ride << ride
      end
    end
    most_pop_ride
  end

  def prof_ride
    most_prof_ride = []
    total_log = []
    @rides.each do |ride|
      total_log << ride.total_revenue
    end
    @rides.each do |ride|
      if ride.total_revenue == total_log.max
        most_prof_ride << ride
      end
    end
    most_prof_ride
  end

  def rev_compiler
    rev = []
    @rides.each do |ride|
      rev << ride.total_revenue
    end
    rev
  end

  def revenue
    rev_compiler.sum
  end
end











# revenue_compiler = []
#   revenue_counter = revenue_compiler.sum
#   @rides.each do |ride|
#     revenue_compiler << ride.total_revenue
#   end
# revenue_counter