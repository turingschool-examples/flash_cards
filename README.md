#  Flash Cards
A command line implementation of a simple flashcard game
<br>

## Objects
  - ### Card
    - #### Methods
      - new(question, answer, category): initializes a new Card object
        -Args
          - Question, Class String: Question to prompt the user for an answer
          - Answer, Class String: Correct answer to the Question
          - Category, Class Symbol: The category for the question
  - ### Deck
    - #### Methods
      - new(cards): initializes a new Deck object, returns cards passed into method
        - Args
          - Cards, Array of Class Card: A collection of cards to use during a round of play
      - count: returns the number of cards current in the deck
      - cards_in_category(category): returns an array of all the cards currently in the deck with the passed category
        - Args
          - Category, Class Symbol: Category to filter the cards in the deck by
  - ### Turn
    - #### Methods
      - new(guess, card): initializes a new turn object, returns card passed to it
        - Args
          - Guess, Class String: User's guess  
          - Card, Class Card:  Card used to prompt the user with question
      - correct?(): returns if the user's guess matches the card's answer
      - feedback: returns a string based on the result of correct?

  - ### Round
    - #### Methods
      - new(deck): initializes a new round object, returns empty array
      - current_card: returns the current card object
      - take_turn(guess): creates a new turn object and adds it to the `@turns` instance array. rotates the cards array in prep for the next turn, returns the current turn object
        - Args
          - guess, Class String: User's guess
      - number_correct: returns integer of the total number of correct guesses so far in the round
      - number_correct_by_category(category):  returns integer of the total number of correct guesses so far in the round that match the passes category
        - Args
          - category, Class Symbol: category to filter the correct guesses by
      - percent_correct: returns float of percentage of correct answers
      - percent_correct_by_category(category): returns float percentage of correct answers matching passed category
        - Args
          - category, Class Symbol: category to filter the correct guesses by
      - turns_remaining: returns integer number of total number of cards - number of turns already taken
      - total_cards: returns integer of total number of cards in deck
      - start: starts the CLI interaction to play the round.
