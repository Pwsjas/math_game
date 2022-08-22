require './Player'
require './Question'

class Game

  attr_accessor :score

  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @current_player = @player1
    @player = "Player 1"

    @question = Question.new
    self.game_loop
  end

  def game_loop
    complete = false
    while complete == false
        #Check winner
      if self.game_complete?
        #Print winner
        if @player1.life == 0
          puts "Player 2 wins with a score of #{@player2.life}/3"
        else
          puts "Player 1 wins with a score of #{@player1.life}/3"
        end

        #Print Game Over, end loop
        puts "----- GAME OVER -----"
        puts "Good bye!"
        complete = true
      else 
        #New turn
        puts "----- NEW TURN -----"

        #Ask Question
        puts "#{@player}: #{@question.generate_question}"
        
        #Wait for answer
        answer = gets.chomp.to_i

        #Check answer and print response
        if answer == @question.answer
          puts self.correct_answer
        else
          puts self.incorrect_answer
          @current_player.lose_life
        end

        #Print current score
        puts self.current_score

        #Change current_player
        if @current_player == @player1
          @current_player = @player2
          @player = "Player 2"
        else
          @current_player = @player1
          @player = "Player 1"
        end
      end
    end
  end

  def game_complete?()
    if @player1.life == 0 || @player2.life == 0
      return true
    else
      return false
    end
  end
  
  def incorrect_answer()
    "#{@player}: Seriously? No!"
  end

  def correct_answer()
    "#{@player}: YES! You are correct."
  end

  def current_score()
    "P1: #{@player1.life}/3 vs P2: #{@player2.life}/3"
  end

end