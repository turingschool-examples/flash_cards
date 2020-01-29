require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require "pry"

class TurnTest < Minitest::Test
def test_if_turn_exists
  card = Card.new("What is the capital of NM?", "Santa Fe", :Geography)
  turn = Turn.new("Santa Fe", card)

  assert_instance_of Turn, turn

end


end

end

# pry(main)> turn = Turn.new("Juneau", card)
# #=> #<Turn:0x00007f99842f0998 @card=#<Card:0x00007f800e29f0c9 @question=""What is the capital of Alaska?", @answer="Juneau", @guess="Juneau">
#
# pry(main)> turn.card
# #=> #<Card:0x00007f800e29f0c8 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>
#
# pry(main)> turn.guess
# #=> "Juneau"
#
# pry(main)> turn.correct?
# #=> true
#
# pry(main)> turn.feedback
# #=> "Correct!"
