require './lib/card.rb'
require './lib/deck.rb'
require 'rspec'

RSpec.describe Deck do

  before :each do
    @test_question1 = "What is the capital of Alaska?"
    @test_ans1 = "Juneau"
    @test_category1 = :Geography
    @card1 = Card.new(@test_question1, @test_ans1, @test_category1)
   
    @test_question2 = "The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?"
    @test_ans2 = "Mars"
    @test_category2 = :STEM
    @card2 = Card.new(@test_question3, @test_ans3, @test_category3)

    @test_question3 = "Describe in words the exact direction that is 697.5° clockwise from due north?"
    @test_ans3 = "North north west"
    @test_category3 = :STEM
    @card3 = Card.new(@test_question3, @test_ans3, @test_category3)

    @cards = [@card1,@card2,@card3]
    @deck = Deck.new(@cards)
  end

  it 'exists' do
    expect(@deck).to be_instance_of(Deck)
  end

  it 'is an array of the correct cards' do
    expect(@deck.cards).to be_a(Array)
    expect(@deck.card_at(0)).to eq(@card1)
    expect(@deck.card_at(1)).to eq(@card2)
    expect(@deck.card_at(2)).to eq(@card3)
  end

  it 'can count elements' do
   expect(@deck.count).to be_a(Integer)
   expect(@deck.count).to eq(@cards.count)
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
