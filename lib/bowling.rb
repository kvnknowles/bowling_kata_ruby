class Bowling
  def initialize rolls
    @rolls = rolls
    @current_roll_index = 0
  end

  def score
    score = 0
    1.upto(10) do |frame|
      if @rolls[@current_roll_index] == 'X'
        score += 10 + get_roll_score(@current_roll_index + 1) + get_roll_score(@current_roll_index + 2)
        @current_roll_index += 1
      elsif is_spare
        score += 10 + spare_bonus
        @current_roll_index += 2
      else  
        score += get_roll_score(@current_roll_index) + get_roll_score(@current_roll_index+1)
        @current_roll_index += 2
      end
    end
    score 
  end

  def get_roll_score index
    @rolls[index].to_i
  end

  def is_spare
    @rolls[@current_roll_index + 1] == '/'
  end

  def spare_bonus
    get_roll_score(@current_roll_index + 2)
  end
end
