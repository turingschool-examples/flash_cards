require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'
require './lib/card'
require 'pry'

class TurnTest < Minitest::Test

    def setup
      @card_1 = Card.new("In what measurement is a horse measured?", "In hands", :Horse)
      @card_2 = Card.new("What is the size difference, in the proper measurement type, between a horse and a pony?", "14.2 hands and bigger is a horse", :Horse)
      @card_3 = Card.new("What does the term 14er refer to?", "A 14,000 or taller mountain", :CO_outdoors)
      @card_4 = Card.new("How many glaciers are in Colorado?", 14, :CO_outdoors)
      @card_5 = Card.new("What does the term toddler mean?", "a young person learning to walk", :Parents)
      @card_6 = Card.new("What does the term infant mean?", "unable to speak", :Parents)
      @turn = Turn.new("In hands", @card_1)
    end

    def test_turn_exists
      @card_1 = Card.new("In what measurement is a horse measured?", "In hands", :Horse)
      assert_instance_of Turn, @turn
    end

    def test_attributes
      @card_1 = Card.new("In what measurement is a horse measured?", "In hands", :Horse)
      @turn = Turn.new("In hands", @card_1)
      assert_equal @card_1, @turn.card
      assert_equal "In hands", @turn.guess
      assert_equal true, @turn.correct?
      assert_equal "Correct", @turn.feedback
    end
  end
