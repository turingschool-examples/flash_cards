require 'minitest/autorun'
require 'minitest/pride'
require './lib/card.rb'
require './lib/deck.rb'



class DeskTest < MiniTest::Test


  def test_card_1
    # skip

    card_1 = Card.new("What is a name that associates with a particular object?", "Variable", :Vocabulary)

    assert_instance_of Card, card_1
  end

  def test_card_2
    # skip

    card_2 = Card.new("Behavior an object can do is a?", "Method", :Vocabulary)

    assert_instance_of Card, card_2
  end

  def test_card_3
    # skip
    card_3 = Card.new("What is an ordered, integer-indexed collection of any object?", "Array", :Vocabulary)

    assert_instance_of Card, card_3
  end

  def test_deck_count



     card_1 = Card.new("What is a name that associates with a particular object?", "Variable", :Vocabulary)
     card_2 = Card.new("Behavior an object can do is a?", "Method", :Vocabulary)
     card_3 = Card.new("What is an ordered, integer-indexed collection of any object?", "Array", :Vocabulary)
     card_4 = Card.new("What is my sons Favorite Movie?", "Iron Giant", :Trivia)

     cards = [card_1, card_2, card_3, card_4]

     deck_1 = Deck.new(cards)

     keep = []


       cards.each do |x|
         if @category == :Vocabulary
           keep << x
         end
       end


     puts keep

    assert_equal 4, cards.count


  end
  #
  # def cards_in_category
  #   cards = []
  #
  #   cards << card_1 = Card.new("What is a name that associates with a particular object?", "Variable", :Vocabulary)
  #   cards << card_2 = Card.new("Behavior an object can do is a?", "Method", :Vocabulary)
  #   cards << card_3 = Card.new("What is an ordered, integer-indexed collection of any object?", "Array", :Vocabulary)
  #   require 'pry'; binding.pry
  #   deck = Deck.new(cards)
  #
  #   assert_equal 3, deck.count
  # end


end
