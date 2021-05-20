class Zoo
  attr_reader :street,
              :city,
              :state,
              :zip_code,
              :inventory

  def initialize(name, street, city, state, zip_code)
    @name = name
    @street = street
    @city = city
    @state = state
    @zip_code = zip_code
    @inventory = []
  end

  def address
    "#{@street} #{@city}, #{@state} #{@zip_code}"
  end

  def animal_count
    @inventory.length
  end

  def add_animal(animal)
    @inventory << animal
  end

  def animals_older_than(age)
    # @inventory.find_all do |animal|
    #   age >= (animal.age_in_days / 7)
    # end
    older = []
    @inventory.each do |animal|
      if (animal.age_in_days / 7) >= age
        older << animal
      end
    end
    older
  end

  def total_weight_of_animals
    weight = 0
    @inventory.each do |animal|
      weight += animal.weight.split.first.to_i
    end
    weight
  end

  def details
    {
      "total_weight" => total_weight_of_animals,
      "street_address" => street
    }
  end

  def animals_sorted_by_weight
    @inventory.sort_by do |animal|
      -(animal.weight.split.first.to_i)
    end
  end

  def animal_hash
    hash = Hash.new

    @inventory.each do |animal|
      first_letter = animal.kind[0]
      if hash[first_letter]
        hash[first_letter] << animal
      else
        hash[first_letter] = [animal]
      end
    end
    hash
  end

end
