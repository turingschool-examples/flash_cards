require_relative '../lib/card.rb'
require_relative '../lib/turn.rb'

RSpec.describe Turn do
  describe '#initialize' do
    example_card = Card.new("What is my name?", "Jon-Boi Caldera", :Personal)
    turn = Turn.new("gobble gobble", example_card)

    it 'exists' do
      expect(turn).to be_instance_of(Turn)
    end

    it 'has a guess' do
      expect(turn.guess).to eq("gobble gobble")
    end

    # Checking to see if the Turn class can access an instance of Card
    it 'can access current card' do
      expect(turn.card).to be_instance_of(Card)
    end
  end

  describe '#correct?' do
    example_card = Card.new("What is my name?", "Jon-Boi Caldera", :Personal)
    incorrect_turn = Turn.new("gobble gobble", example_card)
    correct_turn = Turn.new("Jon-Boi Caldera", example_card)

    it 'can detect correctness of card answer' do
      expect(correct_turn.correct?).to eq(true)
      expect(incorrect_turn.correct?).to eq(false)
    end
  end

  describe '#feedback' do
    example_card = Card.new("What is my name?", "Jon-Boi Caldera", :Personal)
    incorrect_turn = Turn.new("gobble gobble", example_card)
    correct_turn = Turn.new("Jon-Boi Caldera", example_card)
    incorrect_response = "Incorrect."
    correct_response = "Correct!"

    # This test had to be written after the other feedback tests to debug nil
    # being returned by feedback method.
    # Bug Cause: outputting feedback to screen, but not explicitly returning value
    it 'has feedback result that is not nil' do
      expect(incorrect_turn.feedback).not_to be(nil)
    end

    it 'can output appropiate feedback' do
      expect(correct_turn.feedback).to eq(correct_response)
      expect(incorrect_turn.feedback).to eq(incorrect_response)
    end
  end

end
