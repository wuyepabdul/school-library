class Person
  attr_accessor :id, :name, :age
  attr_reader :parent_permission

  def initialize(age:, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..10000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
