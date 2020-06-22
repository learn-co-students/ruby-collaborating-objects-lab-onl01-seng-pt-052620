class Artist

    attr_accessor :name, :songs

    @@all = []

    def initialize (name)

        @name = name
        @songs = []
        save

    end

    def save

        @@all << self unless @@all.include?(self)

    end

    def self.all

        @@all

    end

    def self.find_or_create_by_name(name)

        found = self.all.find {|n| n.name == name}

        if found
            found
        else
            artist = self.new(name)
            artist.save
            artist
        end

        
        
    end

    def add_song(song)

        @songs << song 

    end

    def songs

        @songs

    end

    def print_songs

        @songs.each do |song|
            puts song.name
        end

    end


end

