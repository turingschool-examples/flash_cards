require 'spec_helper'

RSpec.describe Card do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
  end
  
  describe 'initialize' do
    it 'exists' do
      expect(@card_1).to be_instance_of(Card)
    end

    it 'has a question' do
      expect(@card_1.question).to eq("What is the capital of Alaska?")
      expect(@card_2.question).to eq("Which planet is closest to the sun?")
    end

    it 'has an answer' do
      expect(@card_1.answer).to eq("Juneau")
      #another it block for it has another answer
      expect(@card_2.answer).to eq("Mercury")
    end

    it 'has a category' do
      expect(@card_1.category).to eq(:Geography)
      expect(@card_2.category).to eq(:STEM)
    end
  end
end
