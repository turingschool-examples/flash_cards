
require 'minitest/autorun'
require 'minitest/pride'
require './lib/turns'
require './lib/card'
require './lib/deck'
require 'pry'

  class DeckTest < Minitest::Test

    def setup
      @card_1 = Card.new("In what measurement is a horse measured?", "In hands", :Horse)
      @card_2 = Card.new("What is the size difference, in the proper measurement type, between a horse and a pony?", "14.2 hands and bigger is a horse", :Horse)
      @card_3 = Card.new("What does the term 14er refer to?", "A 14,000 or taller mountain", :CO_outdoors)
      @card_4 = Card.new("How many glaciers are in Colorado?", 14, :CO_outdoors)
      @card_5 = Card.new("What does the term toddler mean?", "a young person learning to walk", :Parents)
      @card_6 = Card.new("What does the term infant mean?", "unable to speak", :Parents)
      cards = [@card_1, @card_2, @card_3, @card_4, @card_5, @card_6]
      @deck = Deck.new(cards)
    end
    def test_it_exists
      assert_instance_of Deck, @deck
    end

    def count
      assert_equal 6, deck.count
    end

    def test_cards_in_category
      assert_equal [@card_1, @card_2], @deck.cards_in_category(:Horse)
      assert_equal [@card_3, @card_4], @deck.cards_in_category(:CO_outdoors)
      assert_equal [@card_5, @card_6], @deck.cards_in_category(:Parents)
    end
  end
