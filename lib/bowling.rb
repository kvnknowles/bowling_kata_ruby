class Bowling
  NUMBER_OF_FRAMES = 10
  MAX_FRAME_SCORE = 10
  STRIKE_CHARACTER = 'X'
  SPARE_CHARACTER = '/'

  def initialize(rolls)
    @rolls = rolls
    @current_roll_index = 0
  end

  def score
    final_score = 0
    NUMBER_OF_FRAMES.times { final_score += current_frame_score }
    final_score
  end

  private

  def current_frame_score
    if strike?
      strike_frame_total
    elsif spare?
      spare_frame_total
    else
      non_mark_frame_total
    end
  end

  def non_mark_frame_total
    score = get_roll_score(@current_roll_index) + get_roll_score(@current_roll_index + 1)
    @current_roll_index += 2
    score
  end

  def strike_frame_total
    @current_roll_index += 1
    MAX_FRAME_SCORE + strike_bonus
  end

  def spare_frame_total
    @current_roll_index += 2
    MAX_FRAME_SCORE + spare_bonus
  end

  def get_roll_score(index)
    strike? ? MAX_FRAME_SCORE : @rolls[index].to_i
  end

  def strike?
    @rolls[@current_roll_index] == STRIKE_CHARACTER
  end

  def spare?
    @rolls[@current_roll_index + 1] == SPARE_CHARACTER
  end

  def strike_bonus
    spare? ? MAX_FRAME_SCORE : get_roll_score(@current_roll_index) + get_roll_score(@current_roll_index + 1)
  end

  def spare_bonus
    get_roll_score(@current_roll_index)
  end
end
