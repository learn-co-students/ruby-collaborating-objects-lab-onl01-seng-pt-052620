class MP3Importer 
    attr_accessor :path 
    def initialize(filepath)
        @path = filepath 
    end 

    def files 
        Dir.entries(path).delete_if do |char| char.size < 3 end 
    end 

    def import
        self.files.each do |file|
            Song.new_by_filename(file)
        end   
    end 
end 
  
  
  
  

 
  