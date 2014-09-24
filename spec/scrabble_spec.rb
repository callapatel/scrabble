require './scrabble'

  describe "#self.score" do
    it "returns the score system for the scrabble letters delivered to the player" do
      expect(Scrabble.score).to eq ({"h"=>4} )
    end
  end

  describe "#self.summing_hash_values" do
     it "returns the sum of hash values" do
       expect(Scrabble.summing_hash_values).to eq 4
     end
   end

  describe "#self.tally_score" do
     it "returns the new hash with word key and score value" do
       expect(Scrabble.tally_score).to eq ( {"h"=>4} )
     end
   end

  describe "#self.change_hashy" do
    it "returns the hash into an array formant" do
      expect(Scrabble.change_hashy).to eq [["h", 4]]
    end
    it "responds to 'find'" do
      expect(Scrabble.change_hashy).to respond_to :find
    end
  end

  describe "#self.highest_score_from" do
       it "returns the highest score winner if there is a tie or not a tie" do
         expect(Scrabble.highest_score_from([["h", 4]])).to eq nil
       end
  end

  describe Scrabble do

    describe "#word_split" do
      it "returns word as an array & chars" do
        expect(Scrabble.new("hello").word_split).to eq ["h", "e", "l", "l", "o"]
      end

    describe "#word_check" do
      it "returns an error if not a word" do
        #expect{Scrabble.new("7").word_check}. raise_exception(RunTimeError)
         expect{Scrabble.new(7).word_check}.to raise_error(NoMethodError)
      end
    end
  end
end
