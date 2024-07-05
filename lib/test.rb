class Student
  attr_reader :name, :age

  def initialize(abc, xyz)
    @name = abc
    @name = xyz
  end
end

student = Student.new("Peter",12)

puts student.name
puts student.age