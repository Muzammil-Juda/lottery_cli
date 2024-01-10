class LotteryCard
  attr_accessor :picks
  attr_accessor :pick_pool
  attr_reader :number_pool
  def initialize(card_size, picks_max_count)
    @card_size = card_size
    @picks_max_count = picks_max_count
    @picks = Array.new
  end

  def generate_quick_picks
    number_pool = Array.new
    (1..@card_size).each do |n|
      number_pool << n
    end
    number_pool = number_pool.shuffle
    @picks = number_pool.slice(1,@picks_max_count).sort
  end

  def reset
    @picks = []
  end

  def new_number?(num)
    @picks.index(num).nil?
  end

  def valid_number?(num)
    num >=1 and num <= @card_size
  end

  def pick_this(num)
    @picks << num
    @picks.sort!
  end

  def full?
    @picks.size == @picks_max_count
  end

  def show
    puts "Picks:#{@picks*','}"
  end
end
