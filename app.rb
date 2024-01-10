require_relative "lottery_card"

class App
  def initialize
    @card_size = 30
    @picks_size = 6
    @card = LotteryCard.new(@card_size,@picks_size)
  end 
  def run
    loop do
      break if @card.full?

      puts "Enter a unique number from 1 to #{@card_size}, -1 to generate a quick-pick, nothing to end"
      input = gets.chomp
      break if input.empty?

      begin
        number = Integer(input)
        if number == -1
          @card.generate_quick_picks
        else
          if ! @card.valid_number?(number)
            puts "Not a valid number \a"
            next
          end
          if ! @card.new_number?(number) 
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
lets_go.run
