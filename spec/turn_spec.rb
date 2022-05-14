require './lib/turn'
require './lib/card'
require 'rspec'
require 'pry'

RSpec.describe Turn do #done
  it 'exists' do
    current_turn = Turn.new("This is the answer", "This might be the question?")

    expect(current_turn).to be_instance_of(Turn)
  end

  it 'has guess' do #done
    current_turn = Turn.new("This is the answer", "This might be the question?")

    expect(current_turn.guess).to eq("This is the answer")
  end

  it 'will return current card' do #done
    current_turn = Turn.new("This is the answer", "This might be the question?")

    expect(current_turn.card).to eq("This might be the question?")
  end

  # it 'returns True' do
  #   current_turn = Turn.new("This is the answer", "This might be the question?")
  #
  #   expect(current_turn.correct?).to eq(TRUE)
  # end
  #
  # it 'returns "Correct!"' do
  #   current_turn = Turn.new("This is the answer", "This might be the question?")
  #
  #   expect(current_turn.feedback).to eq("Correct!")
  # end


end
