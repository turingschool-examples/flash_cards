require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'
require './lib/final_feedback.rb'
require 'pry'

RSpec.describe FinalFeedback do
  it 'exists' do
    feedback = FinalFeedback.new
    expect(feedback).to be_instance_of(FinalFeedback)
  end

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
    @feedback = FinalFeedback.new
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
    expect(@feedback.overall(@round)).to eq("That's some GENIUS LEVEL SHIT!!!!!!!!!!")
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
    expect(@feedback.overall(@round)).to eq("Overall, your brain is pretty good!")
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
    expect(@feedback.overall(@round)).to eq("Additional studies are recommended to improve your knowledge.")
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
    expect(@feedback.overall(@round)).to eq("Abysmal. Just ...wow.")
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
    expect(@feedback.categories(@round)).to eq({:FamousPeople => "0% - Abysmal", :Math => "100% - GENIUS LEVEL SHIT", :Philosophy => "67% - Pretty Good"})
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
    expect(@feedback.categories(@round)).to eq({:FamousPeople => "0% - Abysmal", :Math => "100% - GENIUS LEVEL SHIT", :Philosophy => "33% - Needs Improvement"})
  end
end
