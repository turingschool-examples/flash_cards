require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true
require './lib/turn'       # => true

class TurnTest < Minitest::Test                                              # => Minitest::Test
  def test_it_has_turn
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)  # => #<Card:0x00007ff4c48a00f0 @question="What is the capital of Alaska?", @answer="Juneau", @category=:Geography>
    turn = Turn.new("Juneau", card)                                          # => #<Turn:0x00007ff4c48abbd0 @string="Juneau", @card=#<Card:0x00007ff4c48a00f0 @question="What is the capital of Alaska?", @answer="Juneau", @category=:Geography>>

    assert_instance_of Card, card  # => true
    assert_instance_of Turn, turn  # => true
  end                              # => :test_it_has_turn

  def test_it_has_card
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)  # => #<Card:0x00007ff4c48aa8e8 @question="What is the capital of Alaska?", @answer="Juneau", @category=:Geography>
    turn = Turn.new("Juneau", card)                                          # => #<Turn:0x00007ff4c48aa528 @string="Juneau", @card=#<Card:0x00007ff4c48aa8e8 @question="What is the capital of Alaska?", @answer="Juneau", @category=:Geography>>

    assert_instance_of Card, card  # => true
    assert_equal card, turn.card   # => true
  end                              # => :test_it_has_card

  def test_it_has_guess
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)  # => #<Card:0x00007ff4c48a2508 @question="What is the capital of Alaska?", @answer="Juneau", @category=:Geography>
    turn = Turn.new("Juneau", card)                                          # => #<Turn:0x00007ff4c48a10b8 @string="Juneau", @card=#<Card:0x00007ff4c48a2508 @question="What is the capital of Alaska?", @answer="Juneau", @category=:Geography>>

    assert_equal "Juneau", turn.guess  # => true
  end                                  # => :test_it_has_guess

  def test_if_answer_correct
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)  # => #<Card:0x00007ff4c48a38b8 @question="What is the capital of Alaska?", @answer="Juneau", @category=:Geography>
    turn = Turn.new("Juneau", card)                                          # => #<Turn:0x00007ff4c48a3368 @string="Juneau", @card=#<Card:0x00007ff4c48a38b8 @question="What is the capital of Alaska?", @answer="Juneau", @category=:Geography>>

    assert turn.correct?  # => true
  end                     # => :test_if_answer_correct

  def test_correct_feedback_response
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)  # => #<Card:0x00007ff4c48a9038 @question="What is the capital of Alaska?", @answer="Juneau", @category=:Geography>
    turn = Turn.new("Juneau", card)                                          # => #<Turn:0x00007ff4c48a8c00 @string="Juneau", @card=#<Card:0x00007ff4c48a9038 @question="What is the capital of Alaska?", @answer="Juneau", @category=:Geography>>

    assert turn.correct?                    # => true
    assert_equal turn.feedback, "Correct!"  # => true

    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)  # => #<Card:0x00007ff4c517be40 @question="What is the capital of Alaska?", @answer="Juneau", @category=:Geography>
    turn = Turn.new("Bulgogi", card)                                         # => #<Turn:0x00007ff4c517bb20 @string="Bulgogi", @card=#<Card:0x00007ff4c517be40 @question="What is the capital of Alaska?", @answer="Juneau", @category=:Geography>>

    refute turn.correct?                      # => false
    assert_equal turn.feedback, "Incorrect."  # => true
  end                                         # => :test_correct_feedback_response
end                                           # => :test_correct_feedback_response

# >> Run options: --seed 24854
# >>
# >> # Running:
# >>
# >> .....
# >>
# >> Finished in 0.001016s, 4921.2607 runs/s, 9842.5214 assertions/s.
# >>
# >> 5 runs, 10 assertions, 0 failures, 0 errors, 0 skips
