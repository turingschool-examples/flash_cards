
require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require 'pry'

  @card_1 = Card.new("In what measurement is a horse measured?", "In hands", :Horse)
  @card_2 = Card.new("What is the size difference, in the proper measurement type, between a horse and a pony?", "14.2 hands and bigger is a horse", :Horse)
  @card_3 = Card.new("What does the term 14er refer to?", "A 14,000 or taller mountain", :CO_outdoors)
  @card_4 = Card.new("How many glaciers are in Colorado?", 14, :CO_outdoors)
  @card_5 = Card.new("What does the term toddler mean?", "a young person learning to walk", :Parents)
  @card_6 = Card.new("What does the term infant mean?", "unable to speak", :Parents)
  @deck = Deck.new([@card_1, @card_2, @card_3, @card_4, @card_5, @card_6])
  @round = Round.new(@deck)


  def start_round
    @deck.start
    puts @card_1
    # p @card_1.chomp
    # p 
    # puts @card.answer

    # p @card_2.gets
    # p @card.answer
    #
    # p @card_3.gets
    # p @card.answer
    #
    # p @card_4.gets
    # p @card.answer
    #
    # p @card_5.gets
    # p @card.answer
    #
    # p @card_6.gets
    # p @card.answer

  end

    # gets.
    # puts.
