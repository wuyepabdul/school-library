
class Person
  def initialize(name = "Unknown", age, parent_permission = true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def id
    @id
  end

  def name
    @name
  end

  def age
    @age
  end

  def name=(name)
    @name = name
  end

  def age=(age)
    @age = age
  end

  def can_use_services?
    @parent_permission
  end

  def is_of_age?
    @age >= 18
  end
  private_class_method :is_of_age?

end