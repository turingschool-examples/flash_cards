require './lib/card_generator'
require './lib/card'

RSpec.describe CardGenerator do

  before(:all) do
    @TEST_FILE_NAME = './spec/test_cards.txt'
    @EXPECTED_CARDS = [
      Card.new("Question 1", "Answer 1", :Category_A),
      Card.new("Question 2", "Answer 2", :Category_A),
      Card.new("Question 3", "Answer 3", :Category_B),
      Card.new("Question 4", "Answer 4", :Category_B)
    ]

    @EXPECTED_LINES = [
      "Question 1,Answer 1,Category_A",
      "Question 2,Answer 2,Category_A",
      "Question 3,Answer 3,Category_B",
      "Question 4,Answer 4,Category_B"
    ]
  end

  before(:each) do
    @card_generator = CardGenerator.new(@TEST_FILE_NAME)
  end

  it 'exists' do
    expect(@card_generator).to be_instance_of(CardGenerator)
  end

  it 'loads a file' do
    lines = @card_generator.cards_file(@TEST_FILE_NAME)
    expect(lines).to match_array(@EXPECTED_LINES)
  end

  it 'generates cards from given lines' do
    cards = @card_generator.generate_cards_from @EXPECTED_LINES

    @EXPECTED_CARDS.each_with_index do |expected_card, index|
      expect(cards[index].question).to eq(expected_card.question)
    end
  end

  it 'returns cards' do
    cards = @card_generator.cards
    
    @EXPECTED_CARDS.each_with_index do |expected_card, index|
      expect(cards[index].question).to eq(expected_card.question)
    end
  end

end
