class Visitor
  attr_reader :name, :height, :spending_money, :preferences
  def initialize(name, height, spending_input)
    @name = name
    @height = height
    @spending_input = spending_input
    @spending_money = spending_input[1..-1].to_i
    @preferences = []
  end

  def add_preference(preference)
    @preferences << preference
  end

  def tall_enough?(num)
    if @height >= num
      return true
    else
      return false
    end
  end

  def excitement_check(ridepref)
    @preferences.each do |pref| 
      if pref == ridepref 
        return true
      end
    end
    false
  end

  def charge(price)
    @spending_money -= price
  end
end