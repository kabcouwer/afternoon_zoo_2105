class Zoo
  attr_reader :name,
              :street,
              :city,
              :state,
              :zip,
              :inventory,
              :animal_count

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


end
