require './lib/card'

RSpec.describe Card do
  it 'exists' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card).to be_instance_of(Card)
  end

  it 'has a question' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card.question).to eq("What is the capital of Alaska?")
  end

  it 'has an answer' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card.answer).to eq("Juneau")
  end

  it 'has a category' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    expect(card.category).to eq(:Geography)
  end
end

# frozen_string_literal: true

RSpec.describe Turn do
    it "should have a turn class" do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Albuquerque", card)
      expect(turn).to be_truthy
    end

    # attr_reader provides getter methods for guess and card 

    it "should detect if a guess is correct" do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)
      expect(turn.correct?).to eq(true)
    end 

    it "should detect if a guess is incorrect" do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Albuquerque", card)
      expect(turn.correct?).to eq(false)
    end 

    it "should return feedback if the guess is correct" do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)
      expect(turn.feedback).to eq("Correct!")
    end 
    
    it "should return feedback if the guess not correct" do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Boston", card)
      expect(turn.feedback).to eq("Incorrect")
    end 


  end

