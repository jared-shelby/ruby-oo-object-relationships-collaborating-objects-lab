class Song
    @@all = []

    attr_accessor :name, :artist
    
    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        song_details = filename.split(" - ")
        song_name = song_details[1]
        artist_name = song_details[0]
        new_song = Song.new(song_name)
        new_song.artist_name=(artist_name)
        new_song
    end

    def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
        artist.add_song(self)
    end

end