require './lib/card_generator'

RSpec.describe CardGenerator do
  context 'initialize' do
    cards = CardGenerator.make_cards_from_file

    question_1 = "What is 5 + 5?"
    answer_1 = "10"
    category_1 = :STEM

    question_2 = "What is Rachel's favorite animal?"
    answer_2 = "red panda"
    category_2 = :Turing_Staff

    question_3 = "What is Rachel's favorite animal?"
    answer_3 = "red panda"
    category_3 = :Turing_Staff

    question_4 = "What cardboard cutout lives at Turing?"
    answer_4 = "Justin bieber"
    category_4 = :Pop_Culture

    it 'can seperate cards' do
      expect(cards.length).to eq(6)
    end
  end
end
