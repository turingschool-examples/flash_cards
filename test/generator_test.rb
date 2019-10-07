require 'minitest/autorun'

class GeneratorTest < Minitest::Test
  def setup
    @generator = CardGenerator.new
  end

  def test_existence
    assert_instance_of CardGenerator, @generator
  end


end
