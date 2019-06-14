class Song < ActiveRecord::Base
    # add associations here
    belongs_to :song
    belongs_to :genre
    has_many :notes

    # def song_artist_name=(name)
    #     # self.artist = Artist.find_or_create_by(name: name)
    #     artist = Artist.find_or_create_by(name: name)
    #     self.artist = artist
    # end
    #
    # def song_artist_name
    #     # self.artist ? self.artist.name : nil
    #     self.try(:genre).try(:name)
    # end
    #
    # def song_genre_name=(name)
    #     #self.genre = Genre.find_or_create_by(name: name)
    #     genre = Genre.find_or_create_by(name: name)
    #     self.genre = genre
    # end
    #
    # def song_genre_name
    #     #self.genre ? self.genre.name : nil
    #     self.try(:genre).try(:name)
    # end

    def artist_name=(name)
        artist = Artist.find_or_create_by(name: name)
        self.artist = artist
    end

    def artist_name
        self.try(:artist).try(:name)
    end

    def genre_name=(name)
        genre = Genre.find_or_create_by(name: name)
        self.genre = genre
    end

    def genre_name
        self.try(:genre).try(:name)
    end



end
