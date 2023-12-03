require "rspec"
require "./lib/card"
require "./lib/turn"

RSpec.describe Turn do
    it "exists" do
     card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
     turn = Turn.new("Juneau", card)
     expect(turn).to be_instance_of(Turn)
   end

    it "makes a guess" do 
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)
      expect(turn.guess).to eq("Juneau")
    end 

    it "is correct" do 
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)
      expect(turn.correct?).to be(true)
    end

    it "gives feedback" do
      card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
      turn = Turn.new("Juneau", card)
      expect(turn.feedback).to eq("Correct!")
    end


    it "guesses wrong" do 
      card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
      turn = Turn.new("Saturn", card)
      expect(turn.guess).to eq("Saturn") 
    end

    
    

    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

  end 


# pry(main)> require './lib/turn'
# #=> true

# pry(main)> require './lib/card'
# #=> true

# pry(main)> card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
# #=> #<Card:0x007ffdf1820a90 @answer="Mercury", @question="Which planet is closest to the sun?", @category=:STEM>

# pry(main)> turn = Turn.new("Saturn", card)
# #=> #<Turn:0x00007f998413ee60 @card=#<Card:0x007ffdf1820a90 @answer="Mercury", @question="Which planet is closest to the sun?", @category=:STEM>, @guess="Saturn">

# pry(main)> turn.card
# => #<Card:0x007ffdf1820a90 @answer="Mercury", @question="Which planet is closest to the sun?", @category=:STEM>

# pry(main)> turn.guess
# => "Saturn"

# pry(main)> turn.correct?
# => false

# pry(main)> turn.feedback
# => "Incorrect."