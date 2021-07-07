require 'pry'

class Song

    attr_accessor :name, :artist
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def artist=(artist)
        @artist = Artist.find_or_create_by_name(artist.name)
    end

    def self.new_by_filename(filename)
        artist, song, genre = filename.chomp(".mp3").split(" - ")
        new_song = self.new(song)
        new_song.artist_name = artist
        new_song
    end

    def artist_name=(artist_name)
        artist = Artist.find_or_create_by_name(artist_name)
        self.artist = artist
    end
end