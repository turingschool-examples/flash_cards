require './lib/card_generator'
require 'rspec'
filename = "cards.txt"

RSpec.describe CardGenerator do

  context 'class set up' do

    it 'exists' do
      cards = CardGenerator.new(filename)

      expect(cards).to be_instance_of(CardGenerator)
    end

  end

  # context 'class attributes' do

    it 'hold cards in txt file' do
      cards = CardGenerator.new(filename)
      # expects = [Card:0x007f9f1413cbe8 @answer="10", @question="What is 5 + 5?", @category="STEM",
      #            Card:0x007f9f1413c788 @answer="red panda", @question="What is Rachel's favorite animal?", @category="Turing Staff",
      #            Card:0x007f9f1413c2b0 @answer="nobody knows", @question="What is Mike's middle name?", @category="Turing Staff",
      #            Card:0x007f9f14137da0 @answer="Justin bieber", @question="What cardboard cutout lives at Turing?", @category="Pop Culture"]

      expect(cards.cards).to eq(2)
    end
  #
  # end

end
