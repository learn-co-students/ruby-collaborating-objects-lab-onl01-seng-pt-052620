require 'pry'

class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end 

    def add_song(song)
       new_song = Song.new(song)
       song.artist = self
    end 

    def songs
        Song.all.select {|song| song.artist == self}
    end 

    def self.find_or_create_by_name(name)
        existing_artist = self.all.find {|artist| artist.name == name}
        if existing_artist != nil
            return existing_artist
        else 
            return Artist.new(name)  
        end
    end

    def print_songs
       songs_array = self.songs
       songs_array.each do |song|
        puts song.name
       end 
    end 

    def self.all
        @@all
    end 

end 