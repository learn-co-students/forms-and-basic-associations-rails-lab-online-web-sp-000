require 'byebug'

class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

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
    params.require(:song).permit(:title, :genre_id, :artist_name, :notes_content => []) #Hey this is a hash do the hash thing
    #Has to be genre_id because we're passing in the genre_id to associate the genre object with the song object
    
    #If you pass in to :notes => [] it will look for notes objects
    #So you have to pass it into a different array variable name and then do the same thing as with the artist_name
    #Only formatted differently because, array.
    #(Also with the test fuckery with song_notes_1 and song_notes_2 it turns out to just be easier to mix form_for notation and straight up html)
    #Yes you can do that without it breaking
  end
end

