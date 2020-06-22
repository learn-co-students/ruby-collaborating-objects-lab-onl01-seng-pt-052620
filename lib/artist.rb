require 'pry'

class Artist
    
    attr_accessor :name, :song
    @@all = []
    
    def initialize(name)
        @name = name
        @@all << self
        @songs = []
    end

    def self.all
        @@all 
    end

    def add_song(song)
        @songs << song
    end

    def songs
        @songs
    end

    def self.find_or_create_by_name(name)
        result = self.all.find(ifnone = nil) {|artist| artist.name == name}
        if result == nil
            self.new(name)
        else
            result
        end
    end

    def print_songs
        @songs.each do |song|
            puts song.name
        end
    end

end