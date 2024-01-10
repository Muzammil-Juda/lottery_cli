require_relative "lottery_card"
#require_relative "lottery_drawing"

class Lottery
  attr_accessor :number_of_numbers
  attr_accessor  :draw_size
  def initialize(number_of_numbers, draw_size)
    @number_of_numbers = number_of_numbers
    @draw_size = draw_size
  end
  
  def run
    card = LotteryCard.new(@number_of_numbers)
    card.generate_quick_picks(@draw_size)
    card.show
#    puts "Your lottery card quick picks: #{card.quick_picks.join(', ')}"
#
#    drawing = LotteryDrawing.new
#    drawing.draw_winning_numbers
#
#    drawing.check_winning(card)
#
  end

end
