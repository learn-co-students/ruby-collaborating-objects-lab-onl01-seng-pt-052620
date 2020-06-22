class MP3Importer

    attr_accessor :title, :path, :file

    def initialize (path)

        @path = path

    end

    def files

        @file ||= Dir.entries(path).select {|x| x.include?(".mp3")}

    end

    def import

        files.each do |song|
            Song.new_by_filename(song)
        end

    end


end