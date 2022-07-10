require './lib/card'

File.open('lib/flashcards.txt', 'a') do |file|
    puts "Welcome to Flashcard Generator\n\n\n"
    puts "Each flashcard needs 1) a question, 2) an answer, 3) a category.\n\n\n"
    print "Enter your question: "
    question = gets.chomp
    print "\n\nEnter the answer: "
    answer = gets.chomp.split.map(&:capitalize).join(' ')
    print "\n\nFinally, enter the question category: "
    category = gets.chomp.capitalize
    file << "\n#{question}/#{answer}/#{category}"
end

