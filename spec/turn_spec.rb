require './lib/turn'
require './lib/card'
require 'rspec'

RSpec.describe Turn do
  
  before(:each) do
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    @turn_correct_guess = Turn.new("Juneau", @card)
    @turn_incorrect_guess = Turn.new("Denver", @card)
  end

  it 'has guess' do
    expect(@turn_correct_guess.guess).to eq("Juneau")
  end

  it 'has the card object' do
    expect(@turn_correct_guess.card).to be_instance_of(Card)
  end

  it "has a method to verify correct answer" do
    expect(@turn_correct_guess.correct?).to eq(true)
  end

  it "has a way to to verify incorrect answer" do
    expect(@turn_incorrect_guess.correct?).to eq(false)
  end

  it "can provide feedback for correct answer" do
    expect(@turn_correct_guess.feedback).to eq("Correct!")
  end
  it "can provide feedback for incorrect answer" do
    expect(@turn_incorrect_guess.feedback).to eq("Incorrect.")
  end

end