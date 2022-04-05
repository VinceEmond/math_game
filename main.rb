
class Player
  TOTAL_LIVES = 3
  attr_reader :name, :lives

  def initialize(name)
    @name = name
    @lives = TOTAL_LIVES
  end

  def lose_life
    @lives -= 1
  end
end

class MathQuestion
  def initialize
    @rand_num1 = rand(1..20)
    @rand_num2 = rand(1..20)
  end

  def prompt
    "What does #{@rand_num1} + #{@rand_num2} equal?"
  end

  def answer
    @rand_num1 + @rand_num2
  end
end

class MathGame
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end
  
  def play_game(player1, player2)
    puts "\n***********************************" 
    puts "---- Welcome to the math game! ----"
    puts "***********************************" 

    current_player = player1
    winner = nil

    loop do
      play_turn(current_player)
      winner = check_winner(player1, player2)

      if winner != nil
        finish_game(winner)
        break
      else
        show_score(player1, player2)
        puts "\n"
        puts "             NEW TURN              "
        puts "***********************************" 
        current_player = swap_players(player1, player2, current_player)
      end
    end
  end

  def show_score(player1, player2)
    puts "-----------------------------------"
    puts ">>> " \
         "#{player1.name}: #{player1.lives}/#{Player::TOTAL_LIVES} vs " \
         "#{player2.name}: #{player2.lives}/#{Player::TOTAL_LIVES}" \
         " <<<"
    puts "-----------------------------------"  
  end

  def finish_game(winner)
    puts "#{winner.name} wins with a score of #{winner.lives}/#{Player::TOTAL_LIVES}"
    puts "\n"
    puts "***********************************" 
    puts "------------ GAME OVER ------------"
    puts "***********************************" 
    puts "\n"
  end

  def check_winner(player1, player2)
    if player1.lives == 0
      player2
    elsif player2.lives == 0
      player1
    end
  end

  def swap_players(player1, player2, current_player)
    if (current_player == player1)
      player2
    elsif (current_player == player2)
      player1
    end
  end

  def play_turn(current_player)
    question = MathQuestion.new
    puts "#{current_player.name}: #{question.prompt}"
    user_answer = gets.chomp.to_i
    check_answer(question.answer, user_answer, current_player)
  end
  
  def check_answer(expected_answer, user_answer, current_player)
    if user_answer == expected_answer
      puts "=> #{current_player.name} your answer is correct!"
    else
      puts "=> #{current_player.name} your answer is incorrect!"
      current_player.lose_life
    end
  end
end

daryl = Player.new("Daryl")
jimmy = Player.new("Jimmy")
game = MathGame.new(daryl, jimmy)
game.play_game(daryl, jimmy)