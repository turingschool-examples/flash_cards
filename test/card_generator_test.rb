require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test

    def setup
        @filename = "lib/cards.txt"
        @actual_cards = CardGenerator.new(@filename)

        @card_1 = Card.new("India became an independent country in what year?","1947","History")
        @card_2 = Card.new("What is the name of the strait of water that separates the two main islands of New Zealand?","Cook Strait","Geography")
        @card_3 = Card.new("What was the first nation in the Western Hemisphere with a woman as head of state?","Argentina","History")
        @card_4 = Card.new("What distant planet circles the Sun every 84 years?","Uranus","Science")
        @card_5 = Card.new("What is the only fruit to have its seeds on the outside?","Strawberry","Science")
        @card_6 = Card.new("Which is the largest country in Africa by area?","Algeria","Geography")

        @expected_cards = [@card_1, @card_2, @card_3, @card_4, @card_5, @card_6]
    end

    def test_it_exists
        assert_instance_of CardGenerator, @actual_cards
    end

    def test_it_returns_an_array_of_cards
        @expected_cards.each_with_index do |card, index|
            assert_equal card.question, @actual_cards.cards[index].question
            assert_equal card.answer, @actual_cards.cards[index].answer
            assert_equal card.category, @actual_cards.cards[index].category
        end
    end

    def test_it_deals_with_a_wonky_file

    end


end
