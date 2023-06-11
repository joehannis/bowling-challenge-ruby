require_relative 'frames'
require_relative 'score'

class Game
  def initialize
    @frames = Frames.new
    @score = Score.new
    @index = 0
  end

  def bowling_game
    while @index < 10 do
      @index += 1

      puts "What was your score for the first roll?"
      roll = gets.chomp.to_i
      @frames.frame_no(@index)[1] = roll
        
      if roll < 10
        puts "What was your score for the second roll?"
        roll = gets.chomp.to_i
        @frames.frame_no(@index)[2] = roll
      end
      if @frames.frame_no(10)[1] == 10
        frame_10
      end

      turn_calculation
    end
  end

  private

  def turn_calculation
    turn = @frames.frame_no(@index)
    @total_score = @score.score_calculation(turn)
  end
  

  def frame_10
    puts "Strike bonus roll 1 score:"
    roll = gets.chomp.to_i
    @frames.frame_no(10)[:bonus_roll_1] = roll
    puts "Strike bonus roll 2 score:"
    roll = gets.chomp.to_i
    @frames.frame_no(10)[:bonus_roll_2] = roll
    turn = @frames.frame_no(10)
    binding.irb
    @score.calculate_strike(turn)

    @score.running_score
  end
end

game = Game.new
game.bowling_game
