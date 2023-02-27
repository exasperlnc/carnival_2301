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
end