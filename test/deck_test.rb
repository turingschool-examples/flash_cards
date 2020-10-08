require 'minitest/autorun'
require './lib/card'
require './lib/deck'
require 'pry'

class DeckTest < Minitest::Test

    def setup

    end

    def test_it_exists
       
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

       
        deck = Deck.new
       
        assert_instance_of Deck , deck
    end

    def test_it_can_display_card_array

        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        
       assert_equal cards , deck.cards
    end

    def test_it_can_say_card_count
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)


        assert_equal cards.length , deck.count
    end



    def test_it_can_list_cards_in_category
        card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)

    
        assert_equal [card_2,card_3] , deck.cards_in_category(:STEM)
    end

end