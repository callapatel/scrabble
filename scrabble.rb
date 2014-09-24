class Scrabble

  attr_accessor :word, :hash, :total_score, :new_hash

  def initialize(word)
    @word = word
  end

  def assert(test, msg = nil)
    if @word.is_a?(Numeric)
      raise NoMethodError
    end
  end

  def word_split
    @word.split("").to_a
  end

  def self.score
    @hash = {}
    ["h"].each do |n|
      if ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"].include?(n)
        @hash[n] = 1
      elsif ["d", "g"].include?(n)
        @hash[n] = 2
      elsif ["b", "c", "m", "p"].include?(n)
        @hash[n] = 3
      elsif ["f", "h", "v", "w", "y"].include?(n)
        @hash[n] = 4
      elsif ["k"].include?(n)
        @hash[n] = 5
      elsif ["j", "x"].include?(n)
        @hash[n] = 8
      elsif ["q", "z"].include?(n)
        @hash[n] = 10
      end
    end
    @hash
  end

  def self.summing_hash_values
    Scrabble.score
    #new_hash = {}
    @total_score = 0
    @hash.each do |letter, score|
      score.to_i
      @total_score += score #may use reduce here?
      return @total_score
      #want to take total_score and add it to the inital word in a hash.

    end
  end

  def self.tally_score
    summing_hash_values
    @new_hash = {}
    puts @new_hash[Scrabble.new("h").word] = @total_score
    return @new_hash
    #puts new_hash.store(@word, @total_score).inspect
  end

  def self.change_hashy
    a = tally_score
    high_score = []
    a.find_all{|k, v| [k,v] << high_score if v == a.values.max }
  end

  def self.highest_score_from(array_of_words)
    array_of_words = change_hashy
    b = tally_score
    if array_of_words.count > 1
      if b.each {|key, value| puts key, value if key.count == 7 }
        abort("winner, you had a 7 letter word so you won the tie")
      else b.each {|key, value| puts key.length}.min
        abort("winner, you had the max score with the least letters - so you win the tie")
      end
    else #a.count <= 1
      puts "you won this round!"
    end
  end





end
