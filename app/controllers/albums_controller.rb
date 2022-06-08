class AlbumsController < ApplicationController
  before_action :require_user, only:[:index, :show]


  def index
    @albums = Album.all
  end

  def show
    @album = Album.find(params[:id])
    @tracks = @album.tracks
  end

end
