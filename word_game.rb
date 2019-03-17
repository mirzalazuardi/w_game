require 'rspec/autorun'

class WordGame
  attr_reader :words
  def initialize(words)
    @words = words
  end

  def shuffle_word
    words[rand(words_count)]
  end

  private

  def words_count
    words.count
  end
end

RSpec.describe WordGame do
  subject { described_class.new(words) }
  let(:words) { %w[buku pulpen lampu kompas detik tissue] }

  describe '#shuffle_word' do
    it 'is show a word from list' do
      expect(words.include?(subject.shuffle_word)).to eq true
    end
  end

  describe '#shuffle_character' do
  end
end
