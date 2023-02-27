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
end