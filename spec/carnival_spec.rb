require 'rspec'
require './lib/carnival'

RSpec.describe Carnival do
  before(:each) do
    @carnival = Carnival.new({:name => "CarnEvil", :duration => "Eternity"})
    @ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
    @visitor1 = Visitor.new('Bruce', 54, '$10')
    @visitor2 = Visitor.new('Tucker', 36, '$5')
    @visitor3 = Visitor.new('Penny', 64, '$15')
    @ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
    @expensive_ride = Ride.new({ name: 'Big Ferris Wheel', min_height: 36, admission_fee: 100, excitement: :gentle })
    @ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
    @visitor1.add_preference(:gentle)
    @visitor2.add_preference(:gentle)
    @visitor3.add_preference(:gentle)
    @visitor1.add_preference(:water)
  end

  it 'exists' do
    expect(@carnival).to be_a Carnival
  end

  it 'has attributes' do
    expect(@carnival.name).to eq("CarnEvil")
    expect(@carnival.duration).to eq("Eternity")
  end

  it 'adds rides' do
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride2)

    expect(@carnival.rides.count).to eq(2)
  end

  it 'has most pop ride' do
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride2)
    @carnival.add_ride(@ride3)
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor3)
    @ride2.board_rider(@visitor1)
    @ride2.board_rider(@visitor2)


    expect(@carnival.pop_ride).to eq([@ride1])
  end

  it 'has two rides that tie for most popular' do
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride2)
    @carnival.add_ride(@ride3)
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor3)
    @ride2.board_rider(@visitor1)
    @ride2.board_rider(@visitor3)

    expect(@carnival.pop_ride).to eq([@ride1, @ride2])
  end

  it 'has most profitable ride' do
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride2)
    @carnival.add_ride(@ride3)
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor3)
    @ride2.board_rider(@visitor1)
    @ride2.board_rider(@visitor2)


    expect(@carnival.prof_ride).to eq([@ride2])
  end

  it 'has two rides that tie for most profitable' do
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride2)
    @carnival.add_ride(@ride3)
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor2)
    @ride1.board_rider(@visitor3)
    @ride1.board_rider(@visitor1)
    @ride1.board_rider(@visitor1)
    @ride2.board_rider(@visitor1)


    expect(@carnival.prof_ride).to eq([@ride1, @ride2])
  end

  it 'compiles rev' do
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride2)
    @carnival.add_ride(@ride3)
    @ride1.board_rider(@visitor1)
    @ride2.board_rider(@visitor2)
    @ride3.board_rider(@visitor3)

    expect(@carnival.rev_compiler).to eq([1,5,0])
  end

  it 'calculates total carnival revenue' do
    @carnival.add_ride(@ride1)
    @carnival.add_ride(@ride2)
    @carnival.add_ride(@ride3)
    @ride1.board_rider(@visitor1)
    @ride2.board_rider(@visitor2)
    @ride3.board_rider(@visitor3)

    expect(@carnival.revenue).to eq(6)
  end

end