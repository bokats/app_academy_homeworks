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

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
      system("clear")
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 0.75
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
    puts "Enter the first letter of each color on a different line"

    @seq.each do |color|
      user_input = gets.chomp
      if user_input != color[0]
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS.shuffle[-1]
  end

  def round_success_message
    puts "You are moving to the next round"
  end

  def game_over_message
    puts "Game over! You made it #{@sequence_length - 1} times "
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
