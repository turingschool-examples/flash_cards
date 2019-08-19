require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/card_manager'

class CardManagerTest < Minitest::Test
  
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", "Geography")
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", "STEM")
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", "STEM")
    @card_4 = Card.new("Where is Turing based out of?", "Denver", "Geography")
    @card_5 = Card.new("What is 5 + 5?", "10", "STEM")
    @card_6 = Card.new("What is Rachel's favorite animal?", "red panda", "Turing Staff")
    @card_7 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff")
    @card_8 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber", "Pop Culture")
    @cards = [@card_1, @card_2, @card_3, @card_4, @card_5, @card_6, @card_7, @card_8]
    @file_name = "./data/deck_1.txt"
    @card_manager = CardManager.new
  end

  def test_it_exists
    assert_instance_of CardManager, @card_manager
  end

  def test_load_from_file
    @card_manager.load_from_file(@file_name)

    # Needed this makeshift test to check if cards were correct
    # Minitest has difficulties comparing objects with the same values
    # but different object IDs
    pass = true
    @card_manager.cards_by_file[@file_name].each.with_index do |card, i|
      if card.question != @cards[i].question || card.answer != @cards[i].answer || card.category != @cards[i].category
        pass = false
      end
    end

    assert pass
  end
end
