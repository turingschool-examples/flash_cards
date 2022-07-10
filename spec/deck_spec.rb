require './lib/card.rb'
require './lib/deck.rb'
require './lib/card_generator.rb'

RSpec.describe Deck do

  before :each do
    @cardset = CardGenerator.new('cards.txt').temp_deck
         @deck = Deck.new(@cardset)
  end

  it 'exists' do
    expect(@deck).to be_instance_of(Deck)
  end

  it 'is an array of the correct cards' do
    expect(@deck.cards).to be_a(Array)
    @deck.cards.each_with_index do |card, index|
      expect(card).to eq(@cardset[index])
    end
  end

  it 'can count elements' do
   expect(@deck.count).to be_a(Integer)
   expect(@deck.count).to eq(@cardset.count)
  end

  it 'can count cards in category' do
    cat_bins = []
      @deck.cards.each do |card|
        if (cat_bins.include?(card.category)) != true
            cat_bins << card.category
        end
      end

      
      cat_bins.each do |cat|
        cat_cards = []
        @deck.cards.each do |card|
          if card.category == cat
            cat_cards << card 
          end
        end
        expect(@deck.cards_in_category(cat)).to be_a(Array)
        expect(@deck.cards_in_category(cat)).to eq(cat_cards)
      end
  end
end
