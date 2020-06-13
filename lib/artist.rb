class Artist

    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end

    def add_song(song)
        @songs << song
        song.artist = self
    end

    def print_songs
        @songs.each { |song| puts song.name }
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def self.all
        @@all
    end

    def self.find_or_create_by_name(name)
        if self.all.find {|artist_name| artist_name.name == name }
            self.all.find {|artist_name| artist_name.name == name }
        else
            self.new(name)
        end

    end

end
