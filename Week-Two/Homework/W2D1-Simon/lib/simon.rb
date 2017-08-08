class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end
      game_over_message
      reset_game
  end
  # def play
  # until @game_over
  #   take_turn
  #   system("clear")
  # end
  #
  # game_over_message
  # reset_game
  # end

  def take_turn
    unless show_sequence != require_sequence
      round_success_message
      @sequence_length += 1
    else
      @game_over = true
    end
  end
#   def take_turn
#   show_sequence
#   require_sequence
#
#   unless @game_over
#     round_success_message
#     @sequence_length += 1
#   end
#   end

  def show_sequence
    add_random_color
    puts @seq
  end
  # def show_sequence
  #  add_random_color
  #  @seq.each do |color|
  #    puts color
  #    sleep 0.75
  #    system("clear")
  #    sleep 0.25
  #  end
  # end

  def require_sequence
    input = []
    @sequence_length.times do
      input << gets.chomp
    end
    input
  end
 #  def require_sequence
 #   puts "Repeat the sequence by entering the first letter of each color on a new line."
 #   @seq.each do |color|
 #     user_color = gets.chomp
 #     if color[0] != user_color
 #       @game_over = true
 #       break
 #     end
 #   end
 #   sleep 0.25
 # end

  def add_random_color
    @seq << COLORS[rand(0..3)]
  end

  def round_success_message
    puts "Great job! \n Repeat after me..."
  end

  def game_over_message
    puts "Sorry - that was incorrect! \n Game Over"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end



###The specs should guide you as to what each method does.
###One important thing to note is that it is generally
###impractical to test console user input, so the specs
###don't test require_sequence. The goal of require_sequence
###is to prompt the user to repeat back the new sequence
###that was just shown to them, one color at a time. If they
###give an incorrect color, it should immediately set
###@game_over to be true.
