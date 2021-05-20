#iteration2
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
    expect(@zoo.zip_code).to eq("10460")
  end

  it 'has an address' do
    expect(@zoo.address).to eq("2300 Southern Blvd Bronx, NY 10460")
  end

  it 'has an inventory' do
    expect(@zoo.inventory).to eq([])
  end

  it 'animal count starts with zero animals' do
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

  #iteration3
  it 'can see if animals are older than a certain age' do
     animal_1 = Animal.new("Sea Otter", 10, 25)
     animal_2 = Animal.new("Red Panda", 5, 70)
     animal_3 = Animal.new("Capybara", 100, 150)
     animal_4 = Animal.new("Dolphin", 150, 200)
     @zoo.add_animal(animal_1)
     @zoo.add_animal(animal_2)
     @zoo.add_animal(animal_3)
     @zoo.add_animal(animal_4)

     expect(@zoo.animals_older_than(250)).to eq([])
     expect(@zoo.animals_older_than(100)).to eq([animal_3, animal_4])
     expect(@zoo.animals_older_than(10)).to eq([animal_1, animal_2, animal_3, animal_4])
  end

  it 'can return total weight of all animals' do
    animal_1 = Animal.new("Sea Otter", 10, 25)
    animal_2 = Animal.new("Red Panda", 5, 70)
    animal_3 = Animal.new("Capybara", 100, 150)
    animal_4 = Animal.new("Dolphin", 150, 200)
    @zoo.add_animal(animal_1)
    @zoo.add_animal(animal_2)
    @zoo.add_animal(animal_3)
    @zoo.add_animal(animal_4)

    expect(@zoo.total_weight_of_animals).to eq(265)
  end

  it 'can return details about zoo' do
    animal_1 = Animal.new("Sea Otter", 10, 25)
    animal_2 = Animal.new("Red Panda", 5, 70)
    animal_3 = Animal.new("Capybara", 100, 150)
    animal_4 = Animal.new("Dolphin", 150, 200)
    @zoo.add_animal(animal_1)
    @zoo.add_animal(animal_2)
    @zoo.add_animal(animal_3)
    @zoo.add_animal(animal_4)

    expect(@zoo.details).to eq({"total_weight" => 265, "street_address" => "2300 Southern Blvd"})
  end

  #iteration4
  it 'can sort animals by weight' do
    animal_1 = Animal.new("Sea Otter", 10, 25)
    animal_2 = Animal.new("Red Panda", 5, 70)
    animal_3 = Animal.new("Capybara", 100, 150)
    animal_4 = Animal.new("Dolphin", 150, 200)
    @zoo.add_animal(animal_1)
    @zoo.add_animal(animal_2)
    @zoo.add_animal(animal_3)
    @zoo.add_animal(animal_4)

    expect(@zoo.animals_sorted_by_weight).to eq([animal_4, animal_3, animal_1, animal_2])
    end

    it 'can return a hash of animals by first letter' do
      animal_1 = Animal.new("Sea Otter", 10, 25)
      animal_2 = Animal.new("Red Panda", 5, 70)
      animal_3 = Animal.new("Capybara", 100, 150)
      animal_4 = Animal.new("Dolphin", 150, 200)
      @zoo.add_animal(animal_1)
      @zoo.add_animal(animal_2)
      @zoo.add_animal(animal_3)
      @zoo.add_animal(animal_4)
      animal_5 = Animal.new("Dog", 65, 200)
      @zoo.add_animal(animal_5)

      expect(@zoo.animal_hash).to eq({
        "C" => [animal_3],
        "D" => [animal_4, animal_5],
        "R" => [animal_2],
        "S" => [animal_1]
        })
    end
end
