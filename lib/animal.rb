class Animal
  attr_reader :kind,
              :weight,
              :age

  def initialize(kind, weight, age)
    @kind = kind
    @weight = weight
    @age = age
  end

  def weight
    return "#{@weight} pounds"
  end

  def age
    return "#{@age} weeks"
  end

  def age_in_days
    @age * 7
  end

end
