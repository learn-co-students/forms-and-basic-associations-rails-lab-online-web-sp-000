**Models**
@Artist      
:name (string)
has_many @songs
has_many @genres through @songs

@Song
:title (string)
:artist_id
:genre_id
belongs_to @artist
belongs_to @genre
has_many @notes

@Genre
:name (string)
has_many @songs
has_many @artists through @songs

@Note
:content (string)
:song_id
belongs_to @song

**Associations Layout**
@artists   --<    @songs    >--    @genre

                    |
                    ^
                  @notes

**Objectives**
####app/views/songs/new.erb should have:
1. A text input box that sets the song's title.
2. A text input box for the artist.
3. A selection box for genre.
   Users should be able to pick amongst existing genres only.
4. Several text input boxes to add notes to the song.
   These should have the IDs:
   * song_notes_1,
   * song_notes_2,
   * and so on
   for the specs to pass.

*Note*
You might need to search around for
how to pass an array using strong_params
