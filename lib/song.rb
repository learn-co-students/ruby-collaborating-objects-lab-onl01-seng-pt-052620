require 'pry'

class Song

  attr_accessor :name, :artist
  attr_reader :artist_name 

  @@all = [] 

    def initialize(name)
        @name = name 
        @@all << self 
    end 

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end  


    def self.all
        @@all  
    end 

    def self.new_by_filename(filename)
        split_name = filename.split(" - ")
        song = Song.new(split_name[1])
        artist = Artist.find_or_create_by_name(split_name[0]) 
        song.artist = artist
        artist.add_song(song) 
        song  
    end 

  # @@songs = []
  
  # def initialize(name)
  #   @name = name
  #   @@songs << self  
  # end

  # def artist_name=(name)
  #   self.artist = Artist.find_or_create_by_name(name)
  #   artist.add_song(self)
  # end



  # def self.all
  #   @@songs   
  # end

  # def self.new_by_filename(filename)
  #   split_name = filename.split(" - ")
  #   song = Song.new(split_name[1])
  #   artist = Artist.find_or_create_by_name(split_name[0]) 
  #   song.artist = artist
  #   artist.add_song(song) 
  #   song  
end 
 




=begin
  
rescue => exception
  
end
require "pry"

class Song
    attr_accessor :name, :artist
    attr_reader :artist_name   
    @@all = [] 

    def initialize(name)
        @name = name 
        @@all << self 
    end 

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end  


    def self.all
        @@all  
    end 

    def self.new_by_filename(filename)
        split_name = filename.split(" - ")
        song = Song.new(split_name[1])
        artist = Artist.find_or_create_by_name(split_name[0]) 
        song.artist = artist
        artist.add_song(song) 
        song  
    end 

    
end 

=end 
 