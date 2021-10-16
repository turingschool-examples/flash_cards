require 'rspec'
require './lib/card_generator'

RSpec.describe CardGenerator do
  # Setup the intial testing conditions.
  before(:each) do
    @card_1 = Card.new("What is 5 + 5?", "10", :STEM)
    @card_2 = Card.new("What is Rachel's favorite animal?", "red panda", :"Turing Staff")
    @card_3 = Card.new("What is Mike's middle name?", "nobody knows", :"Turing Staff")
    @card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber",:"Pop Culture")
    @cards = [@card_1, @card_2, @card_3, @card_4]
    @filename = 'lib/cards.txt'
    @new_card_gen = CardGenerator.new(@filename)
  end

  # Test initialize method.
  describe '#initialize' do
    it 'can set filename' do
      expect(@new_card_gen.filename).to eq('lib/cards.txt')
    end
  end
  
  # Test #cards method functionality.
  describe '#cards' do
    # Test creation of the card objects by checking if they are an instance of Card.
    it 'can create card objects' do
      expect(@new_card_gen.cards[0]).to be_instance_of(Card)
      expect(@new_card_gen.cards[1]).to be_instance_of(Card)
      expect(@new_card_gen.cards[2]).to be_instance_of(Card)
      expect(@new_card_gen.cards[3]).to be_instance_of(Card)
    end

    # Test #cards will convert text to Card attributes.
    it 'can convert text file to Card objects' do
      expect(@new_card_gen.cards[0]).to have_attributes(:question => "What is 5 + 5?", :answer => "10", :category => :STEM)
      expect(@new_card_gen.cards[1]).to have_attributes(:question => "What is Rachel's favorite animal?", :answer => "red panda", :category => :"Turing Staff")
      expect(@new_card_gen.cards[2]).to have_attributes(:question => "What is Mike's middle name?", :answer => "nobody knows", :category => :"Turing Staff")
      expect(@new_card_gen.cards[3]).to have_attributes(:question => "What cardboard cutout lives at Turing?", :answer => "Justin Bieber", :category => :"Pop Culture")
    end
  end
end