
category = ["Sports", "American History", "Politics", "Entertainment"]


class Card
  attr_accessor :category, :question, :answer

end

one = Card.new
one.category = "Sports"
one.question = "Who won the NHL Stanley Cup last year?"
one.answer = "Washington Capitals"

two = Card.new
two.category = "American History"
two.question = "Who was the first President to be impeached?"
two.answer = "Andrew Johnson"

three = Card.new
three.category = "Politics"
three.question = "Who is the Speaker of the House?"
three.answer = "Nancy Pelosi"

four = Card.new
four.category = "Entertainment"
four.question 

puts "Is #{two.category} a variable for a new instance???"
