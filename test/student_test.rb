require 'minitest/autorun'
require 'minitest/pride'
require './lib/student'

class StudentTest < Minitest::Test

    def setup
      @michael = Student.new("Michael", 28)
    end

    def test_it_exists

      assert_instance_of Student, @michael
    end

    def test_has_an_name

      assert_equal "Michael", @michael.name
    end

    def test_has_an_age

      assert_equal 28, @michael.age
    end

    #student has a laptop
    #student has cookies
end
