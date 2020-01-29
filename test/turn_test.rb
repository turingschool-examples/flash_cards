require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'

class TurnTest < Minitest::Test

  def test_turn_class_exists
    turn = Turn.new('Juneau', 'Card1')
    assert_instance_of Turn, turn
  end

end
#pry(main)> require './lib/turn'
#=> true

#pry(main)> require './lib/card'
#=> true

#pry(main)> card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
#=> #<Card:0x00007f800e29f0c8 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>

#pry(main)> turn = Turn.new("Juneau", card)
#=> #<Turn:0x00007f99842f0998 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @guess="Juneau">

#pry(main)> turn.card
#=> #<Card:0x00007f800e29f0c8 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>

#pry(main)> turn.guess
#=> "Juneau"

#pry(main)> turn.correct?
#=> true

#pry(main)> turn.feedback
