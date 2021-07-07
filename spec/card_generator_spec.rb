require './lib/card_generator'

RSpec.describe CardGenerator do
  context 'initialize' do
    cards = CardGenerator.make_cards_from_file

    it 'can seperate cards' do
      expect(cards).not_to be_empty
    end

    it 'has cards as Card objects' do
      result = cards.all? do |card|
        card.is_a?(Card)
      end

      expect(result).to be(true)
    end
  end

  context 'parsing' do
    cards = CardGenerator.make_cards_from_file

    question_1 = "What is 5 + 5?"
    answer_1 = "10"
    category_1 = :STEM

    question_2 = "What is Rachel's favorite animal?"
    answer_2 = "red panda"
    category_2 = :Turing_Staff

    question_3 = "What is Mike's middle name?"
    answer_3 = "nobody knows"
    category_3 = :Turing_Staff

    question_4 = "What cardboard cutout lives at Turing?"
    answer_4 = "Justin bieber"
    category_4 = :Pop_Culture

    it 'card 1' do
      card_1 = cards.first

      expect(card_1.question).to eq(question_1)
      expect(card_1.answer).to eq(answer_1)
      expect(card_1.category).to eq(category_1)
    end

    it 'card 2' do
      card_2 = cards[1]
      expect(card_2.question).to eq(question_2)
      expect(card_2.answer).to eq(answer_2)
      expect(card_2.category).to eq(category_2)
    end

    it 'card 3' do
      card_3 = cards[2]
      expect(card_3.question).to eq(question_3)
      expect(card_3.answer).to eq(answer_3)
      expect(card_3.category).to eq(category_3)
    end
  end
end
