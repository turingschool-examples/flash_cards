
category = ["Sports", "American History", "Politics", "Entertainment"]


class Card
  attr_accessor :category, :question, :answer



end

one = Card.new
one.category = "Sports"
one.question = "Who won the NHL Stanley Cup last year?"
one.answer = "Washington Capitals"

puts
