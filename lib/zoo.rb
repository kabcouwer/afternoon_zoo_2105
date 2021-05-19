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

  def animals_older_than(weeks)
    # require 'pry'; binding.pry
    @inventory.find_all do |animal|
      weeks >= animal.age
    end
  end

  #also remove text for total weight of animals
  def animals_sorted_by_weight

  end

  def details
    @details = {
      "total_weight" => 265,
      "street_address" => street
    }
  end

  # def animal_hash
  #   animal_hash = {Hash.new { |hash, key| hash[key] = [] }
  #   @inventory.each do |animal|
  #     animal_hash[animal.name] << animal.include?('C')
  #   end
  #   @inventory.each do |animal|
  #     animal_hash[animal.name] << animal.include?('D')
  #   end
  #   @inventory.each do |animal|
  #     animal_hash[animal.name] << animal.include?('R')
  #   end
  #   @inventory.each do |animal|
  #     animal_hash[animal.name] << animal.include?('S')
  #   end
  # end


end
