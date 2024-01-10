class LotteryCard
  attr_reader :picks
  attr_reader :card_size
  attr_reader :picks_size

  def initialize(card_size, picks_size)
    raise "Card size must be > number of possible picks " unless card_size > picks_size
    @card_size = card_size
    @picks_size = picks_size

    @picks = Array.new
  end

  def generate_quick_picks
    number_pool = Array.new
    (1..@card_size).each do |n|
      number_pool << n
    end
    number_pool.shuffle!
    @picks = number_pool.slice(1, @picks_size ).sort
  end

  def reset
    @picks = []
  end

  def unique_number?(num)
    @picks.index(num).nil?
  end

  def within_range?(num)
    num >=1 and num <= @card_size
  end

  def pick_this(num)
    @picks << num
    @picks.sort!
  end

  def full?
    @picks.size == @picks_size
  end

  def show
    puts picks
  end

  def picks # custom getter
    "Picks: #{@picks*','}"
  end

end
