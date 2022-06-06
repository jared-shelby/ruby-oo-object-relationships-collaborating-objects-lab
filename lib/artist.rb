class Artist
    @@all = []

    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select { |song| song.artist == self }
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(artist_name)
        self.all.each do |artist|
            if artist.name == artist_name
                return artist
            end
        end
        return Artist.new(artist_name)
    end

    def print_songs
        puts songs.collect { |song| song.name }
    end
end