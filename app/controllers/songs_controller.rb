class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
    @genres = Genre.all
  end

  def create
    genre = Genre.find_by(id: params[:song][:genre_id])
    artist = Artist.find_or_create_by(name: params[:song][:artist_name])
    @song = Song.new(song_params)
    @song.genre_name = genre.name
    @song.artist_name = params[:song][:artist_name]
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name, :genre_name, note_contents: [])
  end
end
#
# "song"=>
#   {"title"=>"song19",
#    "artist_name"=>"artist19",
#    "genre_id"=>"50",
#    "note_ids"=>["note3", "note4"]},
#  "commit"=>"Create Song",
#  "controller"=>"songs",
#  "action"=>"create"}
