require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true
require './lib/card'       # => true


class CardTest < Minitest::Test  # => Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)  # => #<Card:0x00007fd6d083ee70 @question="What is the capital of Alaska?", @answer="Juneau", @category=:Geography>

    assert_instance_of Card, card  # => true
  end                              # => :test_it_exists

  def test_it_has_a_question
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)  # => #<Card:0x00007fd6d083de58 @question="What is the capital of Alaska?", @answer="Juneau", @category=:Geography>

    assert_equal "What is the capital of Alaska?", card.question  # => true
  end                                                             # => :test_it_has_a_question

  def test_it_has_an_answer
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)  # => #<Card:0x00007fd6d0844a78 @question="What is the capital of Alaska?", @answer="Juneau", @category=:Geography>

    assert_equal "Juneau", card.answer  # => true
  end                                   # => :test_it_has_an_answer

  def test_it_has_a_category
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)  # => #<Card:0x00007fd6d083e650 @question="What is the capital of Alaska?", @answer="Juneau", @category=:Geography>

    assert_equal :Geography, card.category  # => true
  end                                       # => :test_it_has_a_category

end  # => :test_it_has_a_category

# >> Run options: --seed 24571
# >>
# >> # Running:
# >>
# >> ....
# >>
# >> Finished in 0.000796s, 5025.1256 runs/s, 5025.1256 assertions/s.
# >>
# >> 4 runs, 4 assertions, 0 failures, 0 errors, 0 skips
