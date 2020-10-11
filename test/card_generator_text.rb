require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require './lib/card_generator'

class Test < Minitest::Test

  def test_it_can_read_files
    file = File.open("cards.txt")
  end

  def test_it_can_create_cards
    
  end

end
