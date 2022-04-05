# TwO-O-Player Math Game

## Flow of Game
- Both players start the game with 3 lives
- A new math question is generated for each turn by picking two numbers between 1 and 20
- The player whose turn it is is prompted the question and must answer correctly
  - Answers incorrectly
    - Prints feedback to say it was incorrect
    - Loses Life
  - Answers Correctly
    - Prints feedback to say it was correct
- At the end of every turn, game should display the new scores for both players so that the players know where they stand
  - Ex: P1: 2/3 vs P2: 3/3
- Prints '-----NEW TURN----" line
- A new question is asked
- The game continues until one of the players loses all their lives
  - At this point the game anounces who won and what the winner's score was
    - Ex: Player 1 wins with a score of 1/3
  - Prints '----GAME OVER ----' line

-----

## Class Roles

- ### Game Class
  - Role
    - The role of this class is to hold all the information related to each math game instance we are creating.
  - State
    - player1
    - player2
    - current_player
    - current_answer
    - winner
  - Behavior
    - play_game
    - play_turn
    - assert_answer
    - check_winner
    - show_scores
  

- ### Question
  - Role
    - Will hold all the logic for creating new question instances
  - State
    - Random number 1
    - Random number 2
    - question
    - answer
  - Behaviour
    - None..?

  ### Player
  - Role
    - Will be responsible for creating a new instance of a player
  - State
    - lives
    - name
  - Behavior
    - lose_life

-----
## Questions for Mentor
- [ ] Does @current_player = player1 work in the constructor of the MathGame?
Will it pass the reference?
- [ ] How do I create a new question every round? A new question object?
- [ ] To assert the answer, how to I retreive the question's answer?
- [ ] How do I toggle the "current player" after every round?
- [ ] Is it ok to initialize "@current_answer" with no value?
- [ ] How would I got about writing "Player 1:" at the begginning of the string for the question? I opted to create a "name" instance property; Will that work?

### "Furthermore" Questions
- Which class will contain the game loop (where each instance of the loop is the other players turn)?
  - MathGame class
- Which class should manage who the current_player is?
  - MathGame class?
- Which class(es) will contain user I/O and which will not have any?
  - MathGame class will handle user I/O?


-----

## Classes

- ### Class MathGame(player1, player2)
  - Initialize
    - @player1 = player1
    - @player2 = player2
    - @current_player = player1
    - @current_answer
    - @winner = nil
  - play_game
      - puts "Welcome to the math game!"
      - Loop
        - play_turn(current_player)
        - check_winner
        - If @winner != nil
          - print winner summary string
          - print "Game Over"
          - print "Good bye!"
          - Break
        - Else
            - show_scores
            - Update @current_player to the opposite player
            - print "New Turn"
  
  - play_turn(current_player)
    - [Create a new question]
    - [Get User input]
    - assert_answer(question.answer, userInput)
  - show_scores
    - puts "P1: 2/3 vs P2: 3/3"
  - assert_answer(expected, @current_answer)
    - Correct answer
      - Print @current_player your answer is Correct!'
    - Incorrect answer
      - Print @current_player your answer is Incorrect!'
      - remove 1 life from current_player
  - check_winner
    - if a player's lives = 0, set @winner to opposite player

 
- ### Class MathQuestion
  - Initialize
    - @rand_num1 = rand(1..20)
    - @rand_num2 = rand(1..20)
  - question
    - "What does @rand_num1 + @rand_num2 equal?"
  - answer
    - @rand_num1 + @rand_num2

- ### Class Player(name)
  TOTAL_LIVES = 3;
  - Initialize
    - lives = TOTAL_LIVES
    - @name = name
  - lose_life
    - self.lives -= 1



