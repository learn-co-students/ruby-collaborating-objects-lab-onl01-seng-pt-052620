require 'pry'

class Artist

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @@all << self 
  end

  def self.all
    @@all
  end

  def add_song(song)
   song.artist = self 
  end

  def songs
    Song.all.select do |song|
        song.artist == self
    end  
  end  

  def print_songs
    songs.each {|song| puts song.name}
  end




  def self.find_or_create_by_name(name)
    an_artist = @@all.find do |art|
        art.name == name 
   end 

   if an_artist 
        an_artist
   else
       new_artist = Artist.new(name)
   end      
end 

end