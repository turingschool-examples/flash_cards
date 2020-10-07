require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'

class Decktest < Minitest::Test

    def setup
        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        @cards = [@card_1, @card_2, @card_3]
        @deck = Deck.new(@cards)      
    end

    def test_deck_has_cards

        assert_equal @cards, @deck.cards
        assert_equal 3, @deck.count
    end

    def test_cards_by_catetory
        #skip
        expected = @deck.cards.select {|card| card.category == :STEM}
        assert_equal expected, @deck.cards_in_category(:STEM)
        expected = @deck.cards.select {|card| card.category == :Geography}
        assert_equal expected, @deck.cards_in_category(:Geography)
        assert_equal [], @deck.cards_in_category("Pop Culture")
    end
    
    
    
end