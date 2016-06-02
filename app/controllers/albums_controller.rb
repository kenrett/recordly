class AlbumsController < ApplicationController
  def index
    @all_albums = Album.all
  end
end
