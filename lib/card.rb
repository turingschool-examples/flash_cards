class Card
  attr_reader :question,
              :answer,
              :category
  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
end





# card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
# card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
# card_4 = Card.new("How many episodes does Friends sitcom have?", "236 eps", :Movies)
# card_5 = Card.new("Who is the first Asian actor/actress to win Oscar?", "Michelle Yeoh", :Movie)

# puts "Enter your guess"
# guess = gets.chomp

# if guess.empty?
#   p "Don't forget to enter your guess"
#   return
# end
# turn_1 = Turn.new(guess, card_1)
# puts turn_1.feedback
