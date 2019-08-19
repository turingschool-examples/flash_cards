require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'
require 'pry'

  class RoundTest < Minitest::Test

      def setup
        @card_1 = Card.new("In what measurement is a horse measured?", "In hands", :Horse)
        @card_2 = Card.new("What is the size difference, in the proper measurement type, between a horse and a pony?", "14.2 hands and bigger is a horse", :Horse)
        @card_3 = Card.new("What does the term 14er refer to?", "A 14,000 or taller mountain", :CO_outdoors)
        @card_4 = Card.new("How many glaciers are in Colorado?", 14, :CO_outdoors)
        @card_5 = Card.new("What does the term toddler mean?", "a young person learning to walk", :Parents)
        @card_6 = Card.new("What does the term infant mean?", "unable to speak", :Parents)
        @deck = Deck.new([@card_1, @card_2, @card_3, @card_4, @card_5, @card_6])
        @round = Round.new(@deck)
        @new_turn = Turn.new("In hands", @card_1)
        @new_turn_1 = Turn.new("Wrong", @card_2)
      end

      def test_round_exists
        assert_instance_of Round, @round
      end
      def test_that_turn_exists
        assert_instance_of Turn, @round.take_turn("In hands")
      end
      def test_rest
         assert_equal [@card_1, @card_2, @card_3, @card_4, @card_5, @card_6], @round.deck
         assert_equal [], @round.turns
         assert_equal @card_1, @round.current_card
         assert_equal Turn, @new_turn.class
         assert_equal true, @new_turn.correct?
         assert_equal false, @new_turn_1.correct?
         @round.take_turn("In hands")
          # assert_equal [@new_turn], @round.turns
          # @round.take_turn("14.2 hands and bigger is a horse")
          assert_equal 1, @round.number_correct
          assert_equal @card_2, @round.current_card
      #    assert_equal 2, @round.turns.count
      #    assert_equal "Incorrect", @round.turns.last.feedback
      #    assert_equal 1, @round .number_correct
      #    assert_equal 1, @round.number_correct_by_category(:Horse)
      #    assert_equal 0, @round.number_correct_by_category(:CO_outdoors)
      #    assert_equal 50.0, @round.percent_correct
      #    assert_equal @card_3, @round.current_card
      #
      end
  end
