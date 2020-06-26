class MP3Importer
    attr_accessor :song
    attr_reader :path 

    def initialize(path)
        @path = path
        @song = song
        
    end

    def files 
        Dir.entries(path).delete_if {|filename| [".", ".."].include? filename}
    end   
 
    def import 
     self.files.each do |filename|
        Song.new_by_filename(filename)
        # Artist.all << song.artist unless Artist.all include?(song.artist)
        end
    end

end
