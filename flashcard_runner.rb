class Question 
    attr_accessor :prompt, :answer, :card_num, :category
    def initialize(prompt, answer, card_num, category)
        @prompt = prompt
        @answer = answer
        @card_num = card_num
        @category = category
    end
end

# q1 = "What color are apples?\n(a)red\n(b)blue\n(c)silver"
# q2 = "What color are bananas?\n(a)red\n(b)yellow\n(c)silver"
# q3 = "What color are pears?\n(a)red\n(b)blue\n(c)yellow"
# q4 = "What color are my shoes?\n(a)blue\n(b)white\n(c)black"

q1 = "What word follows in this common Halloween phrase.\nTrick or treat, smell my ...."
q2 = "What is the capital of Oklahoma?"
q3 = "Mixing blue and yellow paint makes what color?"
q4 = "Finish this phrase. In the hit classic cartoon
of the 80's, TRANSFORMERS, Opitmus Prime's often said
'Autobots, transform and ...' what? "

questions = [
    Question.new(q1, "feet", 1, :PopCulture),
    Question.new(q2, "oklahoma city", 2, :Geography),
    Question.new(q3, "green", 3, :STEM),
    Question.new(q4, "rollout", 4, :PopCulture)
    ]

def run_test(questions)
    answer = ""
    score = 0
    correct_by_category = Hash.new(0)
    total_by_category = Hash.new(0)
  
    for question in questions
        puts
        puts ("\nThis is card number " + question.card_num.to_s + " out of 4")
        puts
        puts question.prompt
        puts 
        puts "Enter your guess:"
        puts
        answer = gets.chomp().downcase
        total_by_category[question.category] += 1
        if answer == question.answer
            score += 1
            correct_by_category[question.category] += 1
            puts "\n******************************"
            puts "     ********************"
            puts "\n           Correct!" 
            # puts ("\nThis is card number " + question.card_num.to_s + " out of 4")
            puts "\n     ********************"
            puts "******************************"
            puts 
        else
            puts "\n******************************"
            puts "     ********************"
            puts "\n          Incorrect."
            # puts ("\nThis is card number " + question.card_num.to_s + " out of 4")
            puts "\n     ********************"
            puts "******************************"
            puts 
        end
    end

        total_percent = (score.to_f / questions.length) * 100

        puts "\n******************************"
        puts "     ********************"
        puts "\n        GAME OVER!!!"
        puts "\n  Your Stats:"
        puts ("\n  You got " + score.to_s + " correct out of " + questions.length().to_s)
        puts ("  Your total score is " + total_percent.to_s + "%")
        
        total_by_category.each do |category, total|
            percent = (correct_by_category[category].to_f / total) * 100
            puts ("  #{category} -- #{percent.round(2)}% correct")
        end
        puts "\n     ********************"
        puts "******************************"
        puts 

end

puts
puts "\n------------------------------------------------"
puts "Welcome! You're playing with 4 cards."
puts "------------------------------------------------"

run_test(questions)