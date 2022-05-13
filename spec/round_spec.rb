require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require 'rspec'

RSpec.describe Round do


  it "exists" do
    card1 = Card.new("What is the capitol of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capitol of Texas?", "Austin", :Geography)
    card3 = Card.new("Who is the first officer of the Starship Enterprise D?", "Riker", :Star_Trek_Trivia)
    card4 = Card.new("Who is the chief engineer of the Starship Enterprise D?", "La Forge", :Star_Trek_Trivia)
    deck = Deck.new([card1, card2, card3, card4])
    round = Round.new(deck)
    expect(round).to be_instance_of Round
  end


  it "makes sure current card of new round is card 1" do
    card1 = Card.new("What is the capitol of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capitol of Texas?", "Austin", :Geography)
    card3 = Card.new("Who is the first officer of the Starship Enterprise D?", "Riker", :Star_Trek_Trivia)
    card4 = Card.new("Who is the chief engineer of the Starship Enterprise D?", "La Forge", :Star_Trek_Trivia)
    deck = Deck.new([card1, card2, card3, card4])
    round = Round.new(deck)
    expect(round.current_card).to eq card1
  end

  it "stores the turn" do
    card1 = Card.new("What is the capitol of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capitol of Texas?", "Austin", :Geography)
    card3 = Card.new("Who is the first officer of the Starship Enterprise D?", "Riker", :Star_Trek_Trivia)
    card4 = Card.new("Who is the chief engineer of the Starship Enterprise D?", "La Forge", :Star_Trek_Trivia)
    deck = Deck.new([card1, card2, card3, card4])
    round = Round.new(deck)
    expect(round.take_turn("Juneau")).to be_instance_of Turn
  end

  it "records a guess" do
    card1 = Card.new("What is the capitol of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capitol of Texas?", "Austin", :Geography)
    card3 = Card.new("Who is the first officer of the Starship Enterprise D?", "Riker", :Star_Trek_Trivia)
    card4 = Card.new("Who is the chief engineer of the Starship Enterprise D?", "La Forge", :Star_Trek_Trivia)
    deck = Deck.new([card1, card2, card3, card4])
    round = Round.new(deck)
    turn = round.take_turn("Juneau")
    expect(round.turns[0]).to eq turn
  end

  it "changes current card after turn is taken" do
    card1 = Card.new("What is the capitol of Alaska?", "Juneau", :Geography)
    card2 = Card.new("What is the capitol of Texas?", "Austin", :Geography)
    card3 = Card.new("Who is the first officer of the Starship Enterprise D?", "Riker", :Star_Trek_Trivia)
    card4 = Card.new("Who is the chief engineer of the Starship Enterprise D?", "La Forge", :Star_Trek_Trivia)
    deck = Deck.new([card1, card2, card3, card4])
    round = Round.new(deck)
    turn = round.take_turn("Juneau")
    expect(round.current_card).to eq card2
  end

end
