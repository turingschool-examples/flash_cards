require './lib/card_generator'

RSpec.describe CardGenerator do

  context 'Initialize' do
    it 'exists' do
      filename = "./resources/cards.txt"
      gen = CardGenerator.new(filename)

      expect(gen).to be_a(CardGenerator)
    end

    it 'has a file' do
      filename = "./resources/cards.txt"
      gen = CardGenerator.new(filename)

      expect(gen.file).to be_a(File)
    end
  end

  context 'Methods' do
    it 'converts each line of the text to an array' do
      filename = "./resources/cards.txt"
      gen = CardGenerator.new(filename)
      expect(gen.file_to_array).to eq(["What is 5 + 5?,10,STEM", "What is Rachel's favorite animal?,red panda,Turing Staff", "What is Mike's middle name?,nobody knows,Turing Staff", "What cardboard cutout lives at Turing?,Justin bieber,PopCulture"])
    end

    it 'splits each string in the array at the , creating new arrays' do
      filename = "./resources/cards.txt"
      gen = CardGenerator.new(filename)
      cards_as_strings = gen.file_to_array

      expect(gen.split_string(cards_as_strings)).to eq([["What is 5 + 5?", "10" , "STEM"], ["What is Rachel's favorite animal?", "red panda", "Turing Staff"], ["What is Mike's middle name?", "nobody knows", "Turing Staff"], ["What cardboard cutout lives at Turing?", "Justin bieber", "PopCulture"]])

    end

    it 'creates Cards based on each array' do
      filename = "./resources/cards.txt"
      gen = CardGenerator.new(filename)
      cards_as_strings = gen.file_to_array
      cards_as_arrays = gen.split_string(cards_as_strings)

      card1 = Card.new("What is 5 + 5?", "10", :STEM)
      card2 = Card.new("What is Rachel's favorite animal?", "red panda", :Turing_Staff)
      card3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_Staff)
      card4 = Card.new("What cardboard cutout lives at Turing?", "Justin bieber", :PopCulture)

      cards = gen.make_cards(cards_as_arrays)
      expect(cards[0].question). to eq(card1.question)
      expect(cards[1].question). to eq(card2.question)
      expect(cards[2].question). to eq(card3.question)
      expect(cards[3].question). to eq(card4.question)
      expect(cards[0].answer). to eq(card1.answer)
      expect(cards[1].answer). to eq(card2.answer)
      expect(cards[2].answer). to eq(card3.answer)
      expect(cards[3].answer). to eq(card4.answer)
      expect(cards[0].category). to eq(card1.category)
      expect(cards[1].category). to eq(card2.category)
      expect(cards[2].category). to eq(card3.category)
      expect(cards[3].category). to eq(card4.category)
    end

    it 'combines all previous methods into one' do
      filename = "./resources/cards.txt"
      gen = CardGenerator.new(filename)
      cards = gen.cards

      card1 = Card.new("What is 5 + 5?", "10", :STEM)
      card2 = Card.new("What is Rachel's favorite animal?", "red panda", :Turing_Staff)
      card3 = Card.new("What is Mike's middle name?", "nobody knows", :Turing_Staff)
      card4 = Card.new("What cardboard cutout lives at Turing?", "Justin bieber", :PopCulture)

      expect(cards[0].question). to eq(card1.question)
      expect(cards[1].question). to eq(card2.question)
      expect(cards[2].question). to eq(card3.question)
      expect(cards[3].question). to eq(card4.question)
      expect(cards[0].answer). to eq(card1.answer)
      expect(cards[1].answer). to eq(card2.answer)
      expect(cards[2].answer). to eq(card3.answer)
      expect(cards[3].answer). to eq(card4.answer)
      expect(cards[0].category). to eq(card1.category)
      expect(cards[1].category). to eq(card2.category)
      expect(cards[2].category). to eq(card3.category)
      expect(cards[3].category). to eq(card4.category)
    end
  end
end
