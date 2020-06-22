class Song

    attr_accessor :name, :artist

    @@all = []

    def initialize(name)

        @name = name
        save

    end

    def save

        @@all << self

    end

    def self.all

        @@all

    end

    def self.new_by_filename(name)

        song = self.new(name)
        song.name = name.split(" - ")[1].chomp(".mp3")
        song.artist_name = name.split(" - ")[0]
        song

    end

    def artist_name=(name)

        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)

    end



end