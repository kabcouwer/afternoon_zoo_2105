require 'rspec'
require './lib/animal'
require './lib/zoo'

RSpec.describe Zoo do
  before :each do
    @zoo = Zoo.new("Bronx Zoo", "2300 Southern Blvd", "Bronx", "NY", "10460")
  end

  it 'exists' do
    expect(@zoo).to be_a(Zoo)
  end

  it 'has readable attributes' do
    expect(@zoo.street).to eq("2300 Southern Blvd")
    expect(@zoo.city).to eq("Bronx")
    expect(@zoo.state).to eq("NY")
    expect(@zoo.zip).to eq("10460")
  end

  it 'has an address' do
    expect(@zoo.address).to eq("2300 Southern Blvd Bronx, NY 10460")
  end

  it 'has an inventory' do
    expect(@zoo.inventory).to eq([])
  end

  it 'has an animal count' do
    expect(@zoo.animal_count).to eq(0)
  end

  it 'can add animals to animal count' do
    animal_1 = Animal.new("Sea Otter", 10, 25)
    animal_2 = Animal.new("Red Panda", 5, 70)
    @zoo.add_animal(animal_1)
    @zoo.add_animal(animal_2)

    expect(@zoo.inventory).to eq([animal_1, animal_2])
    expect(@zoo.animal_count).to eq(2)
  end

end
