require_relative '../lib/round'
require_relative '../lib/deck'
require_relative '../lib/card'
require_relative '../lib/turn'
require 'rspec'

RSpec.describe Round do
  before :each do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  it 'exists' do
    expect(@round).to be_instance_of(Round)
  end

  it 'has a deck' do
    expect(@round.deck).to eq(@deck)
  end

  it 'starts with no turns' do
    expect(@round.turns).to eq([])
  end

  it 'has a current card' do
    expect(@round.current_card).to eq(@card_1)
  end

  it 'can take a turn' do
    new_turn = @round.take_turn("Juneau")
    expect(new_turn).to be_instance_of(Turn)
    expect(new_turn.correct?).to be true
    expect(@round.turns.count).to eq(1)
    expect(@round.turns.first.guess).to eq("Juneau")
    expect(@round.current_card).to eq(@card_2)
  end

  it 'can count number correct' do
    @round.take_turn("Juneau")
    expect(@round.number_correct).to eq(1)
    @round.take_turn("Venus")
    expect(@round.number_correct).to eq(1)
  end

  it 'can count number correct by category' do
    @round.take_turn("Juneau")
    @round.take_turn("Mars")
    expect(@round.number_correct_by_category(:Geography)).to eq(1)
    expect(@round.number_correct_by_category(:STEM)).to eq(1)
  end

  it 'can calculate percent correct' do
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    expect(@round.percent_correct).to eq(50.0)
  end

  it 'can calculate percent correct by category' do
    @round.take_turn("Juneau")
    @round.take_turn("Mars")
    expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
    expect(@round.percent_correct_by_category(:STEM)).to eq(100.0)
  end

  it 'can start the round and display welcome message' do
    allow(@round).to receive(:puts)
    allow(@round).to receive(:gets).and_return("Juneau", "Mars", "North north west")
    expect { @round.start }.to output(/Welcome! You're playing with 3 cards./).to_stdout
  end

  it 'can display questions and take guesses' do
    allow(@round).to receive(:puts)
    allow(@round).to receive(:gets).and_return("Juneau", "Mars", "North north west")
    expect { @round.start }.to output(/Question: What is the capital of Alaska?/).to_stdout
    expect { @round.start }.to output(/Question: The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?/).to_stdout
    expect { @round.start }.to output(/Question: Describe in words the exact direction that is 697.5° clockwise from due north?/).to_stdout
  end

  it 'can display feedback for each guess' do
    allow(@round).to receive(:puts)
    allow(@round).to receive(:gets).and_return("Juneau", "Venus", "North north west")
    expect { @round.start }.to output(/Correct!/).to_stdout
    expect { @round.start }.to output(/Incorrect./).to_stdout
  end

  it 'can display final score and percent correct by category' do
    allow(@round).to receive(:puts)
    allow(@round).to receive(:gets).and_return("Juneau", "Mars", "North north west")
    expect { @round.start }.to output(/You had 3 correct guesses out of 3 for a total score of 100%./).to_stdout
    expect { @round.start }.to output(/Geography - 100% correct/).to_stdout
    expect { @round.start }.to output(/STEM - 100% correct/).to_stdout
  end
end
