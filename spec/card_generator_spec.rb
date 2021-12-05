require './lib/card_generator'
require './lib/card'
RSpec.describe CardGenerator do
  it "is an instance of CardGenerator" do
    filename = "cards.txt"
    card_generator = CardGenerator.new(filename)

    expect(card_generator).to be_instance_of(CardGenerator)
  end

  describe '#cards' do
    it "reads and organizes text file" do
      filename = "cards.txt"
      card_1 = Card.new("What is 5 + 5?", "10", :STEM)
      card_2 = Card.new("What is Rachel's favorite animal?", "red panda", "Turing Staff")
      card_3 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff")
      card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin bieber", "PopCulture")
      cards_arr = [card_1, card_2, card_3, card_4]
      cards = CardGenerator.new(filename)

      expect(cards.cards).to be_an(Array)
      expect(cards.cards.sample).to be_a(Card)
    end
  end
end
