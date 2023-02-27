require_relative 'ride'
class Carnival
  attr_reader :name, :duration, :rides, :summary
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
  def visitor_count
    v_count = []
    @rides.each do |ride|
      v_count << ride.rider_log.keys
    end
    v_count.count
  end

  def summary
    sum = {}
    sum[:visitor_count] = v_count
    sum[:revenue_earned] = revenue
    sum
  end
end