require './lib/card'
require './lib/deck'
require 'pry'


RSpec.describe Deck do
    describe '#initialize'do
    it "exists" do
    card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    cards = [card_1, card_2, card_3]
    deck = Deck.new(cards)
    expect(deck).to be_instance_of(Deck)
  end

    end
      it 'is an array' do
      card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
      card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
      cards = [card_1, card_2, card_3]
      deck = Deck.new(cards)
      expect(cards).to eq([card_1, card_2, card_3])

    end

     describe '#count' do
       it "counts the elements in cards array" do
       card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
       card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
       card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
       cards = [card_1, card_2, card_3]
       deck = Deck.new(cards)
       expect(deck.count).to eq(3)
     end
     end

      it "returns category" do
       card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
       card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
       card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
       cards =[card_1, card_2, card_3]
       deck = Deck.new(cards)
      expect([card_1],deck.cards_in_category).to eq,(:Geography)
      expect([card_2,card_3],deck.cards_in_category).to eq(:STEM)

    end


  end



    #card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    #card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    #card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    #cards = [card_1, card_2, card_3]
    #deck = Deck.new(cards)
    #expect(card).to be_a(card)
  #end

  #it 'returns an array of cards' do
    #card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    #card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    #card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    #cards = [card_1, card_2, card_3]
    #deck = Deck.new(cards)
    #expect(deck.cards).to eq([card_1, card_2, card_3])
  #end


   #describe '#count' do
      #it "returns the card count" do
        #card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        #card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
        #card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
        #cards = [card_1, card_2, card_3]
        #deck = Deck.new(cards)

        #expect(deck.cards).to eq(3)
      #end
    #end

#end
