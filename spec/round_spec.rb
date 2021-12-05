require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require 'pry'

RSpec.describe Round do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  it 'exists' do
    expect(@round).to be_instance_of(Round)
  end

  it 'uses a deck' do
    expect(@round.deck).to eq(@deck)
  end

  it 'has a current_card' do
    expect(@round.current_card).to eq(@card_1)
  end

  it 'takes a turn' do
    new_turn = @round.take_turn("Juneau")
    expect(new_turn.class).to eq(Turn)
    expect(new_turn.correct?).to eq(true)
  end

  it 'saves the turn' do
    expect(@round.turns).to eq([])
    new_turn = @round.take_turn("Juneau")
    expect(@round.turns).to eq([new_turn])
    next_turn = @round.take_turn("Mars")
    expect(@round.turns).to eq([new_turn, next_turn])
  end

  it 'gives the number of correct answers' do
    new_turn = @round.take_turn("Juneau")
    expect(@round.number_correct).to eq(1)
    next_turn = @round.take_turn("Mars")
    expect(@round.number_correct).to eq(2)
  end

  it 'advances to the next card after each turn' do
    expect(@round.current_card).to eq(@card_1)
    new_turn = @round.take_turn("Juneau")
    expect(@round.current_card).to eq(@card_2)
    next_turn = @round.take_turn("Mars")
    expect(@round.current_card).to eq(@card_3)
  end
end

RSpec.describe Round do
  before(:each) do
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
    new_turn = @round.take_turn("Juneau")
    next_turn = @round.take_turn("Mars")
    last_turn = @round.take_turn("South")
  end

  it 'counts the number of correct answers' do
    expect(@round.number_correct).to eq 2
    expect(@round.turns.count).to eq 3
    expect(@round.turns.last.feedback).to eq("Incorrect.")
  end

  it 'counts the number of correct answers' do
    expect(@round.number_correct).to eq 2
    expect(@round.turns.count).to eq 3
    expect(@round.turns.last.feedback).to eq("Incorrect.")
  end

  it 'counts correct answers by category' do
    @round.number_correct_by_category(:Geography)
    expect(@round.number_correct_by_category(:Geography)).to eq 1
    expect(@round.number_correct_by_category(:STEM)).to eq 1
  end

  it 'calculates percent correct' do
    expect(@round.percent_correct).to eq(66.7)
  end

  it 'calculates percent correct by category' do
    expect(@round.percent_correct_by_category(:Geography)).to eq(100.0)
    expect(@round.percent_correct_by_category(:STEM)).to eq(50.0)
  end

  it 'stays on last card when end of deck is reached' do
    expect(@round.current_card).to eq(@card_3)
  end
end

RSpec.describe Round do
  before(:each) do
    card_1 = Card.new('What recording artist in 1993 changed their name to a symbol that is not included in the Ruby character map?', 'Prince', :FamousPeople)
    card_2 = Card.new('You have seven times more potatoes than the difference of nine and six. How many potatoes do you have?', 21, :Math)
    card_3 = Card.new('Complete this piece of sage advice: "Live, Laugh, _____."', 'Love', :Philosophy)
    card_4 = Card.new('Which famous scientologist starred in the year-2000 trainwreck known as Battlefield Earth?', 'John Travolta', :FamousPeople)
    card_5 = Card.new('Two rabbits mate and have 4 baby rabbits, who grow up to make 16 new babies. If a rabbit eats two carrots a day, how many carrots are needed to feed the whole family for a week?', 308, :Math)
    card_6 = Card.new('"Go to bed with itchy butt, wake up with _______."', 'stinky fingers', :Philosophy)
    card_7 = Card.new('Who is the legendary pop diva that ROASTED rapper Jay-Z on a ground-breaking double album in 2016?', 'Beyoncé', :FamousPeople)
    card_8 = Card.new('You cut a large cheese wheel into 40 equal wedges. You eat four of the cheese wedges, give one to your neighbor, and lose five when you accidentally leave them on the roof of your car before driving off. You put the remaining wedges back together to form a circle with a missing section. If one edge of the missing section of this incomplete cheese wheel were to represent the minute hand pointing at 12 on a clock, and if the other edge of the missing section represented the clock\'s hour hand, what is the SMALLEST number that the hour hand could be pointing to?', 3, :Math)
    card_9 = Card.new('Between FAST, CHEAP, and GOOD, any project can only be how many of these things?', 2, :Philosophy)
    cards = [card_1, card_2, card_3, card_4, card_5, card_6, card_7, card_8, card_9]
    deck = Deck.new(cards)
    @round = Round.new(deck)
    #@feedback = FinalFeedback.new
  end

  it 'gives feedback for a spectacular overall score' do
    turn_1 = @round.take_turn("Prince")
    turn_2 = @round.take_turn("21")
    turn_3 = @round.take_turn("Love")
    turn_4 = @round.take_turn("John Travolta")
    turn_5 = @round.take_turn("308")
    turn_6 = @round.take_turn("stinky fingers")
    turn_7 = @round.take_turn("Beyoncé")
    turn_8 = @round.take_turn("3")
    turn_9 = @round.take_turn("2")
    expect((@round.overall_feedback)).to eq("That's some GENIUS LEVEL SHIT!!!!!!!!!!")
  end

  it 'gives feedback for a decent overall score' do
    turn_1 = @round.take_turn("MISS")
    turn_2 = @round.take_turn("21")
    turn_3 = @round.take_turn("MISS")
    turn_4 = @round.take_turn("MISS")
    turn_5 = @round.take_turn("308")
    turn_6 = @round.take_turn("stinky fingers")
    turn_7 = @round.take_turn("Beyoncé")
    turn_8 = @round.take_turn("3")
    turn_9 = @round.take_turn("2")
    expect((@round.overall_feedback)).to eq("Overall, your brain is pretty good!")
  end

  it 'gives feedback for a not-good overall score' do
    turn_1 = @round.take_turn("MISS")
    turn_2 = @round.take_turn("21")
    turn_3 = @round.take_turn("MISS")
    turn_4 = @round.take_turn("MISS")
    turn_5 = @round.take_turn("308")
    turn_6 = @round.take_turn("MISS")
    turn_7 = @round.take_turn("Beyoncé")
    turn_8 = @round.take_turn("MISS")
    turn_9 = @round.take_turn("MISS")
    expect((@round.overall_feedback)).to eq("Additional studies are recommended to improve your knowledge.")
  end

  it 'gives feedback for a terrible overall score' do
    turn_1 = @round.take_turn("MISS")
    turn_2 = @round.take_turn("MISS")
    turn_3 = @round.take_turn("MISS")
    turn_4 = @round.take_turn("MISS")
    turn_5 = @round.take_turn("MISS")
    turn_6 = @round.take_turn("MISS")
    turn_7 = @round.take_turn("MISS")
    turn_8 = @round.take_turn("MISS")
    turn_9 = @round.take_turn("MISS")
    expect((@round.overall_feedback)).to eq("Abysmal. Just ...wow.")
  end

  it 'gives feedback for individual categories' do
    turn_1 = @round.take_turn("MISS")
    turn_2 = @round.take_turn("21")
    turn_3 = @round.take_turn("MISS")
    turn_4 = @round.take_turn("MISS")
    turn_5 = @round.take_turn("308")
    turn_6 = @round.take_turn("stinky fingers")
    turn_7 = @round.take_turn("MISS")
    turn_8 = @round.take_turn("3")
    turn_9 = @round.take_turn("2")
    expect((@round.category_feedback)).to eq({:FamousPeople => "0% - Abysmal", :Math => "100% - GENIUS LEVEL SHIT", :Philosophy => "67% - Pretty Good"})
  end
  
  it 'gives feedback for individual categories' do
    turn_1 = @round.take_turn("MISS")
    turn_2 = @round.take_turn("21")
    turn_3 = @round.take_turn("MISS")
    turn_4 = @round.take_turn("MISS")
    turn_5 = @round.take_turn("308")
    turn_6 = @round.take_turn("stinky fingers")
    turn_7 = @round.take_turn("MISS")
    turn_8 = @round.take_turn("3")
    turn_9 = @round.take_turn("MISS")
    expect((@round.category_feedback)).to eq({:FamousPeople => "0% - Abysmal", :Math => "100% - GENIUS LEVEL SHIT", :Philosophy => "33% - Needs Improvement"})
  end
end
