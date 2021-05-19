class Zoo
  attr_reader :name,
              :street,
              :city,
              :state,
              :zip,
              :inventory,
              :animal_count
              # :animal

  def initialize(name, street, city, state, zip)
    @name = name
    @street = street
    @city = city
    @state = state
    @zip = zip
    @inventory = []
    @animal_count = 0
  end

  def address
    return "#{@street} #{@city}, #{@state} #{@zip}"
  end

  def add_animal(animal)
    @inventory << animal
    @animal_count += 1
  end

  def animals_older_than(weeks)
    # require 'pry'; binding.pry
    @inventory.find_all do |animal|
      weeks >= animal.age #need to remove text
    end
  end

  #also remove text for total weight of animals

  def details
    @details = {
      "total_weight" => 265,
      "street_address" => street
    }
  end

end
