require 'pry'

class Artist

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def add_song(song)
    # binding.pry
    # song.artist = self
    # self.all
    @songs << song

  end

  def songs
    @songs
  end

  def self.find_or_create_by_name(artist)
    # binding.pry
    artist_search = @@all.find {|listing| listing.name == artist}
    if artist_search == artist
      return artist
    else
      Artist.new(artist)
    end
  end

end