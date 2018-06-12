class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = get_song
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params(:title, :released, :release_year, :artist_name, :genre))
    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = get_song
  end

  def update
    @song = get_song
    if @song.update(song_params(:title, :released, :release_year, :artist_name, :genre))
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = get_song
    @song.destroy
    redirect_to songs_path
  end

  private
  def song_params(*args)
    params.require(:song).permit(*args)
  end

  def get_song
    Song.find(params[:id])
  end
end
