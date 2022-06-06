class MP3Importer
    attr_reader :path

    def initialize(path)
        @path = path
    end

    # Dir["#{path}/*.mp3"] somehow returns all the files in the directory
    # then, collect each filename and get rid of the directory path that preceeds the song details
    # return just the song details 
    def files
        @files = Dir["#{path}/*.mp3"].collect{|filename| filename.gsub("#{path}/", "")}
    end

    # Song.new_by_filename will take care of parsing the actual song details, which are messy atm
    def import
        files.each {|file| Song.new_by_filename(file)}
    end
end