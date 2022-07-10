require './lib/card.rb'
require './lib/turn.rb'
require './lib/deck.rb'
require './lib/round.rb'
require './lib/Card_generator.rb'

RSpec.describe Round do
  before :each do
    cardset = CardGenerator.new('cards.txt').temp_deck
    @deck = Deck.new(cardset)
    @card = @deck.card_at(0)
    @guess_wrong = "arbitrarily wrong"
    @guess_correct = @card.answer
    @turn_correct = Turn.new(@card.answer, @card)
    @turn_wrong = Turn.new(@guess_wrong, @card)
    @round = Round.new(@deck)
  end

  it 'exists' do
    expect(@round).to be_instance_of(Round)
  end


  it 'correctly makes a deck' do
    expect(@round.deck).to be_instance_of(Deck)
    expect(@round.deck).to eq(@deck)
  end


  it 'has empty turn array at first' do
    expect(@round.turns).to eq([])
  end


  it 'gives current card' do
    expect(@round.current_card).to eq(@deck.card_at(@round.card_index))
  end

  it 'correctly takes a turn & stores argument' do
    new_turn = @round.take_turn("Juneau")

    expect(new_turn).to be_instance_of(Turn)
    expect(new_turn.guess).to eq("Juneau")
    expect(new_turn.card).to eq(@card)
  end
  

  it 'identifies correct and incorrect guesses' do
    @round_correct = Round.new(@deck)
    @index = 0
    while (@round_correct.card_index < @round.deck.count) do
      new_turn = @round_correct.take_turn(@deck.card_at(@index).answer)
      @index += 1
      expect(new_turn.correct?).to eq(true)
    end

    @round_incorrect = Round.new(@deck)
    while (@round_incorrect.card_index < @round.deck.count) do
      new_turn = @round_incorrect.take_turn(@guess_wrong)
      expect(new_turn.correct?).to eq(false)
    end
  end

  it 'correctly saves turns into an array accessible with .turns' do
    new_turn = @round.take_turn(@guess_correct)

    expect(@round.turns).to eq([new_turn])
  end

  it 'stores the right # of turns' do
    @round.take_turn(@guess_correct)
    @round.take_turn(@guess_wrong)
    @round.take_turn(@guess_wrong)

    expect(@round.turns.count).to eq(3)
  end

  it 'counts correct guesses' do
    @round.take_turn(@guess_correct)
    @round.take_turn(@guess_wrong)
    @round.take_turn(@guess_wrong)
    

    expect(@round.number_correct).to eq(1)
  end

  it 'advances turn' do
    turn_one = @round.take_turn(@card.answer)

    expect(@round.current_card).to eq(@deck.card_at(1))
  end

  it 'counts correct guesses by category' do
    @round.take_turn(@guess_correct)
    @round.take_turn(@guess_wrong)
    if @deck.card_at(0).category == @deck.card_at(1).category
      expect(@round.number_correct_by_category(@deck.card_at(0).category)).to eq(1)
    else
      expect(@round.number_correct_by_category(@deck.card_at(0).category)).to eq(1)
      expect(@round.number_correct_by_category(@deck.card_at(1).category)).to eq(0)
    end
  end

  it 'calculates percent correct' do
    @round.take_turn(@card.answer)
    @round.take_turn(@guess_wrong)
    
    expect(@round.percent_correct).to eq(50.0)
  end

  it 'calculates percent correct by category' do
    @round.take_turn(@card.answer)
    @round.take_turn(@guess_wrong)
    if @deck.card_at(0).category == @deck.card_at(1).category
      expect(@round.percent_correct_by_category(@deck.card_at(0).category)).to eq(50.0)
    else
      expect(@round.percent_correct_by_category(@deck.card_at(0).category)).to eq(100.0)
      expect(@round.percent_correct_by_category(@deck.card_at(1).category)).to eq(0.0)
    end
  end

  it '#current_card can pull correct current card after two guesses' do
    @round.take_turn(@card.answer)
    @round.take_turn(@guess_wrong)

    expect(@round.current_card).to eq(@deck.card_at(2))
  end

end
