###  Flash Cards

## Table of contents
* [General info](#general-info)
* [Screenshots](#screenshots)
* [Learning Goals](#learning-goals)
* [Technologies](#technologies)
* [Setup](#setup)
* [Features](#features)
* [Status](#status)
* [Contact](#contact)

## General info
This project is a basic Ruby flashcard runner. Users can access flashcards
from a .txt file containing questions, answers, and categories for each card.
The program is able to evaluate a user's guesses and give feedback at the
end of a session.

View the starter repository here:
[Flash Cards](http://backend.turing.io/module1/projects/flashcards)

## Screenshots
![Flash Cards CLI Image](https://user-images.githubusercontent.com/826189/125210604-1e6a0580-e25e-11eb-8388-737590acbd29.png)

## Learning Goals
* Follow an interaction pattern
* Write readable code that adheres to Ruby convention
* Write tests
* Create an Object Oriented Solution to a problem (objects should interact to achieve the stated goal)
* Host code on Github and submit a Pull Request

## Technologies
Project is created with:
* Ruby version: 2.7.2

## Setup
To run this program, save a copy of this repository locally. In the MacOS
application 'Terminal,' navigate into the _night writer_ directory. Next, place
a text file (.txt) to be translated in the same directory. Then, run it using
ruby (note: '$' is not typed).

1. Clone the repo using the web url:
   ```
   $ git clone https://github.com/michaelpmattson/flash_cards.git
   ```
   or with a password-protected SSH key:
   ```
   $ git clone git@github.com:michaelpmattson/flash_cards.git
   ```
2. Change into the directory:
   ```
   $ cd ../flash_cards
   ```
3. Run by entering the following into Terminal:
   ```
   $ ruby flashcard_runner.rb
   ```

## Features
List of features ready and TODOs for future development
* __Flash Cards__ opens a .txt file in read-only format to populate cards.
* Users are able to type answers in the command line and see immediate feedback.
* At the end of a session the game prints results and percentages for each card category.

To-do list:
* Project meets requirements for _"Iterations 1-4"_.
* Flash card file _"cards.txt"_ is currently hardcoded into the game.
  Subsequent Iterations would include functionality for users to use their own .txt file.
* Flash card file currently requires a very specific format for cards. Subsequent
  versions would also introduce improved error-handling.


## Status
Project is: _in progress_

## Contact
Created by
* [@michaelpmattson](https://github.com/michaelpmattson)

~ feel free to contact me ~
