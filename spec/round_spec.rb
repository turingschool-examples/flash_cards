require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

 require 'pry';
 #binding.pry

RSpec.describe Round do
  # exists
  it 'exists' do
    round = Round.new(1)

    expect(round).to be_a Round
  end

  it 'contains a deck' do
  # contains a deck
    card_1 = Card.new("Question1", "Answer1", :cat1)
    card_2 = Card.new("Question2", "Answer2", :cat1)
    card_3 = Card.new("Question3", "Answer3", :cat2)

    # cards = [card_1, card_2, card_3]

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    expect(round.deck).to eq deck
  end

  it 'has a turn counter, empty in beginning' do
  # contains turn counter
    card_1 = Card.new("Question1", "Answer1", :cat1)
    card_2 = Card.new("Question2", "Answer2", :cat1)
    card_3 = Card.new("Question3", "Answer3", :cat2)

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    expect(round.turns_array).to eq []
  end

  it 'pulls current card (topdeck)' do
  # displays current card deck.cards[0] (clean this up)
    card_1 = Card.new("Question1", "Answer1", :cat1)
    card_2 = Card.new("Question2", "Answer2", :cat1)
    card_3 = Card.new("Question3", "Answer3", :cat2)

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    expect(round.current_card).to eq card_1
  end

  it 'can create a take_turn method' do
  # has new_turn method which is round.take_turn("guess")
    card_1 = Card.new("Question1", "Answer1", :cat1)
    card_2 = Card.new("Question2", "Answer2", :cat1)
    card_3 = Card.new("Question3", "Answer3", :cat2)

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    expect(round.current_card).to eq card_1

  end

  it 'can create a new Turn class with round.take_turn' do
    # new_turn is actually a Turn class? does that mean that occurs in turn.rb
    card_1 = Card.new("Question1", "Answer1", :cat1)
    card_2 = Card.new("Question2", "Answer2", :cat1)
    card_3 = Card.new("Question3", "Answer3", :cat2)

    deck = Deck.new([card_1, card_2, card_3])

    round = Round.new(deck)

    new_turn = round.take_turn("Answer1")

    expect(new_turn).to be_a Turn

  end

  it 'holds the current_card in the new_turn' do
    # new_turn can return .correct? (makes sense why it's in the turn class now)
    card_1 = Card.new("Question1", "Answer1", :cat1)
    card_2 = Card.new("Question2", "Answer2", :cat1)
    card_3 = Card.new("Question3", "Answer3", :cat2)

    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    round = Round.new(deck)
    round.current_card


    new_turn = round.take_turn("Answer1")

    expect(new_turn.card).to be card_1

  end

  it 'can access .correct? with right answer' do
    # new_turn can return .correct? (makes sense why it's in the turn class now)
    card_1 = Card.new("Question1", "Answer1", :cat1)
    card_2 = Card.new("Question2", "Answer2", :cat1)
    card_3 = Card.new("Question3", "Answer3", :cat2)

    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    round = Round.new(deck)
    round.current_card

    new_turn = round.take_turn("Answer1")

    expect(new_turn.correct?).to be true

  end

  it 'stores the turn information that was used' do
    # entire turn information gets stored into round's turns_array array
    card_1 = Card.new("Question1", "Answer1", :cat1)
    card_2 = Card.new("Question2", "Answer2", :cat1)
    card_3 = Card.new("Question3", "Answer3", :cat2)

    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    round = Round.new(deck)
    round.current_card

    new_turn = round.take_turn("Answer1")

    new_turn.correct?

    new_turn.feedback

    round.turns_array.push(new_turn)

    expect(round.turns_array).to eq [new_turn]

  end

  it 'can display the number of turns in array' do
  ####### Initial Setup
        card_1 = Card.new("Question1", "Answer1", :cat1)
        card_2 = Card.new("Question2", "Answer2", :cat1)
        card_3 = Card.new("Question3", "Answer3", :cat2)

        cards = [card_1, card_2, card_3]

        deck = Deck.new(cards)

        round = Round.new(deck)
  ###### Turn sequence
        round.current_card

        new_turn = round.take_turn("Answer1")

        new_turn.correct?

        new_turn.feedback

        round.turns_array.push(new_turn)
      expect(round.turns_array.count).to eq 1
  ###### NOW WE DO "ANOTHER NEW_TURN"
        round.current_card
        new_turn2 = round.take_turn("Wrong Answer")
        new_turn2.correct?
        new_turn2.feedback

        round.turns_array.push(new_turn2)

      expect(round.turns_array.count).to eq 2
  end


  it 'has a counter that increases per number correct' do
    # logs number correct

########### Initial Setup
    card_1 = Card.new("Question1", "Answer1", :cat1)
    card_2 = Card.new("Question2", "Answer2", :cat1)
    card_3 = Card.new("Question3", "Answer3", :cat2)

    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    round = Round.new(deck)
###########

########### Turn sequence
    round.current_card

    new_turn = round.take_turn("Answer1")

    new_turn.correct?

    new_turn.feedback

    round.turns_array.push(new_turn)
###########

########### Store and analyse
    expect(round.number_correct).to eq 1

    # NOW WE DO "ANOTHER NEW_TURN"
    round.current_card
    new_turn2 = round.take_turn("Wrong Answer")
    new_turn2.correct?
    new_turn2.feedback

    expect(round.number_correct).to eq 1
  end

### THIS TEST DEPENDS ON PASSING THE TEST ABOVE, NOT TOUCHING UNTIL THAT'S DONE
  it 'can turn that number into a percent' do
    # divides number correct by total cards
########### Initial Setup
    card_1 = Card.new("Question1", "Answer1", :cat1)
    card_2 = Card.new("Question2", "Answer2", :cat1)
    card_3 = Card.new("Question3", "Answer3", :cat2)

    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    round = Round.new(deck)
###########

########### Turn sequence
    round.current_card

    new_turn = round.take_turn("Answer1")

    new_turn.correct?

    new_turn.feedback

    round.turns_array.push(new_turn)
###########

########### Store and analyse
    expect(round.percent_correct).to eq 100

    # NOW WE DO "ANOTHER NEW_TURN"
    round.current_card
    new_turn2 = round.take_turn("Wrong Answer")
    new_turn2.correct?
    new_turn2.feedback

    expect(round.percent_correct).to eq 50
    # vv I think I can disregard below, because we are comparing to the turns taken.
    # careful this number stored total cards at beginning, in case shrinkage
  end

  it 'will pull the next card when take_turn is called again' do
    # discards card played during turn
    # not necessarily, but .shift should still work here, because cards_remaining
    # displays new current card
    # take turn happens
    card_1 = Card.new("Question1", "Answer1", :cat1)
    card_2 = Card.new("Question2", "Answer2", :cat1)
    card_3 = Card.new("Question3", "Answer3", :cat2)

    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    round = Round.new(deck)
    round.current_card

    new_turn = round.take_turn("Answer1")

    new_turn.correct?

    new_turn.feedback

    round.turns_array.push(new_turn)

    # NOW WE DO "ANOTHER NEW_TURN"
    round.current_card
    new_turn2 = round.take_turn("Wrong Answer")
    new_turn2.correct?
    new_turn2.feedback

    expect(new_turn2.card).to be card_2

  end

  it 'can access the last turn feedback' do
    # reveals correct or incorrect with round.turns.last.feedback
    card_1 = Card.new("Question1", "Answer1", :cat1)
    card_2 = Card.new("Question2", "Answer2", :cat1)
    card_3 = Card.new("Question3", "Answer3", :cat2)

    cards = [card_1, card_2, card_3]

    deck = Deck.new(cards)

    round = Round.new(deck)
    round.current_card

    new_turn = round.take_turn("Answer1")

    new_turn.correct?

    new_turn.feedback

    round.turns_array.push(new_turn)

    # NOW WE DO "ANOTHER NEW_TURN"
    round.current_card
    new_turn2 = round.take_turn("Wrong Answer")
    new_turn2.correct?
    new_turn2.feedback
    round.turns_array.push(new_turn2)

    expect(round.turns_array.last.feedback).to eq "Sorry, but no..."
  end

  xit 'can access the category of a correct answer, returns length?' do
  # stores number correct by category

  end

  xit 'can turn that number into a percent' do
    # divides number correct by total cards
    # careful this number stored total cards at beginning, in case shrinkage
  end

  xit 'keeps going' do
  # will display next card until there are no cards left

  end
end
