require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/card_manager'

class CardManagerTest < Minitest::Test
  
  def setup
    @file_name = "./data/deck_1.txt"
    @card_manager = CardManager.new
  end

  def test_it_exists
    assert_instance_of CardManager, @card_manager
  end

end
