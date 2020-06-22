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

    def artist= (artist)
        @artist = artist
    end

    def self.new_by_filename(filename)
        song_info_array = filename.chomp(".mp3").split(" - ")
        artist = song_info_array[0]
        song = song_info_array[1]
        genre = song_info_array[2]
        new_song = Song.new(song)
        new_song.artist_name = artist
        new_song
    end

    def artist_name= (artist_name)
        artist = Artist.find_or_create_by_name(artist_name)
        self.artist = artist
        artist.songs << self
    end
end