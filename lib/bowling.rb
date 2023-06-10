require_relative 'frames'
require_relative 'score'

class Game
  def initialize
    @frames = Frames.new
    @score = Score.new
    @index = 10
  end

  def bowling_game
    while @index > 0 do
      puts "What was your score for the first roll?"
      roll = gets.chomp.to_i
      @frames.frame_no(@index)[1] = roll
      if @index == 10 && @frames.frame_no(10)[1] == 10
        frame_10

      elsif roll < 10
        puts "What was your score for the second roll?"
        roll = gets.chomp.to_i
        @frames.frame_no(@index)[2] = roll
      end

      turn_calculation
      scoresheet
      @index -= 1
    end
  end

  private

  def turn_calculation
    turn = @frames.frame_no(@index)
    @total_score = @score.score_calculation(turn, @index)
  end
  
  def scoresheet
    @score.running_score.each_with_index do |frame, index|
      puts "Frame #{index + 1}: #{frame[1]} #{frame[2]}"
    end
    puts "Total Score: #{@total_score}"
  end

  def frame_10
    puts "Strike bonus roll 1 score:"
    roll = gets.chomp.to_i
    @frames.frame_no(10)[:bonus_roll_1] = roll
    puts "Strike bonus roll 2 score:"
    roll = gets.chomp.to_i
    @frames.frame_no(10)[:bonus_roll_2] = roll
    turn = @frames.frame_no(10)
    scoresheet
  end
end

game = Game.new
game.bowling_game
