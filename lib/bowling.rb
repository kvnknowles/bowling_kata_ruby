class Bowling
  NUMBER_OF_FRAMES = 10
  MAX_FRAME_SCORE = 10
  STRIKE_CHARACTER = 'X'
  SPARE_CHARACTER = '/'

  def initialize rolls
    @rolls = rolls
    @current_roll_index = 0
  end

  def score
    score = 0
    1.upto(NUMBER_OF_FRAMES) do |frame|
      if is_strike
        @current_roll_index += 1
        score += MAX_FRAME_SCORE + strike_bonus
      elsif is_spare
        @current_roll_index += 2
        score += MAX_FRAME_SCORE + spare_bonus
      else  
        score += get_roll_score(@current_roll_index) + get_roll_score(@current_roll_index+1)
        @current_roll_index += 2
      end
    end
    score 
  end

  private
  def get_roll_score index
    is_strike ? MAX_FRAME_SCORE : @rolls[index].to_i
  end

  def is_strike
    @rolls[@current_roll_index] == STRIKE_CHARACTER
  end

  def is_spare
    @rolls[@current_roll_index + 1] == SPARE_CHARACTER
  end

  def strike_bonus
    is_spare ? MAX_FRAME_SCORE : get_roll_score(@current_roll_index) + get_roll_score(@current_roll_index + 1)
  end

  def spare_bonus
    get_roll_score(@current_roll_index)
  end
end
