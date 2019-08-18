require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'

class DeckTest < Minitest::Test

    def setup
        @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

        @cards = [@card_1, @card_2, @card_3]

        @deck = Deck.new(@cards)
    end

    def test_it_exists
        assert_instance_of Deck, @deck
    end

    def test_it_has_cards
        assert_equal @cards, @deck.cards
    end

    def test_count_method_returns_number_of_cards
        assert_equal 3, @deck.count
    end

    def test_it_returns_array_of_cards_in_given_category
        assert_equal [@card_2, @card_3], @deck.cards_in_category(:STEM)
        assert_equal [@card_1], @deck.cards_in_category(:Geography)
        assert_equal [], @deck.cards_in_category("Pop Culture")
    end

    def test_it_can_handle_a_single_card
        one_card_deck = Deck.new(@card_2)

        assert_instance_of Deck, one_card_deck
        assert_equal [@card_2], one_card_deck.cards
        assert_equal 1, one_card_deck.count
        assert_equal [@card_2], one_card_deck.cards_in_category(:STEM)
        assert_equal [], one_card_deck.cards_in_category(:Geography)
    end
end
