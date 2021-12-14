require_relative './person.rb'

class Teacher < Person
  def initialize(specialization)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
