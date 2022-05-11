require 'rspec'
require './lib/turn'
require './lib/card'

RSpec.describe Turn do
    before do
      @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      @turn = Turn.new("Juneau", @card)
    end

  describe '#initialize' do
    it 'is an instance of turn' do
      expect(@turn).to be_instance_of(Turn)
    end
  end

  it 'has a guess by default' do
    expect(@turn.guess).to eq("Juneau")
  end


  describe '#correct?' do
    it 'identifies a correct guess' do
      expect(@turn.correct?).to eq true
    end

    it 'identifies a case insensitive correct guess' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("juneau", card)
      expect(turn.correct?).to eq true
    end

    it 'identifies an incorrect guess' do
      card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      turn = Turn.new("saturn", card)
      expect(turn.correct?).to eq false
    end
  end

  describe '#correct?' do
    it 'gives correct feedback on a correct answer' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)
      expect(turn.feedback?).to eq('Correct')
    end

    it 'gives correct feedback on a case insensitive correct answer' do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("juneau", card)
      expect(turn.feedback?).to eq('Correct')
    end

    it 'gives correct feedback on an incorrect answer' do
      card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      turn = Turn.new("Saturn", card)
      expect(turn.feedback?).to eq('Incorrect')
    end
  end
end
