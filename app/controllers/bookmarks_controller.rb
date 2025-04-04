class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.new(list_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save!
      redirect_to list_path(@list)
    else
      render 'lists/show', status: :unprocessable_entity
    end
  end

  def delete

  end

  private

  def list_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
