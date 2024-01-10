require_relative "lottery_card"

class App
  attr_reader :card

  def initialize(card_size=30, pick_size=6)
    @card = LotteryCard.new(card_size, pick_size)
  end 

  def run
    loop do
      break if @card.full?

      puts "Enter a unique number from 1 to #{@card.card_size}, -1 to generate a quick-pick, nothing to end"
      input = gets.chomp
      
      break if input.empty?

      begin
        number = Integer(input)
        if number == -1
          @card.generate_quick_picks
        else
          if ! @card.within_range?(number)
            puts "Not in range\a"
            next
          end
          if ! @card.unique_number?(number) 
            puts "Pick a number not already chosen"
            next
          end
          @card.pick_this(number)
        end
      rescue ArgumentError
        puts "Invalid input. Please enter a valid number."
      end
      @card.show
    end # loop
    if @card.full?
      puts "Good luck!"
    end
 end # run
end # class App

lets_go = App.new
#lets_go.card.generate_quick_picks
lets_go.run
