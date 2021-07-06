require './lib/card_generator'

RSpec.describe CardGenerator do
  context 'initialize' do
    generator = CardGenerator.new

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

    it 'exists' do
      expect(generator).to be_a(CardGenerator)
    end

    it 'can seperate cards' do
      expect(generator.file_reader.length).to eq(4)
    end
  end
end
