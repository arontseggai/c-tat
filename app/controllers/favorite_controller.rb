class FavoriteController < ApplicationController
  def like

    favorite = Favorite.new

    favorite.quote_id = set_quote.id
    favorite.user_id = current_user.id
    favorite.save! 

    redirect_to "/"
  end    

  def dislike
    set_quote 
    @quote.destroy
    redirect_to favorites_path
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end
end
