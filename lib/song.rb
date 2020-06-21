require 'pry'

class Song
    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end 

    def self.new_by_filename(filename)
        new_song = Song.new(filename.split("-")[1].strip)
        new_song.artist = Artist.new(filename.split("-")[0].strip)
        new_song
    end 

    def artist_name=(name)
       existing_artist = Artist.all.find {|item| item.name == name}
       if existing_artist == nil
            self.artist = Artist.new(name)
       else
            self.artist = existing_artist
       end 
    end 

    def self.all
        @@all
    end 

end 
