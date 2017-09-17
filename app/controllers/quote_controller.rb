class QuoteController < ApplicationController
  skip_before_action :authenticate_user!, only: [:random]

  def random
    @quote = Quote.order("RANDOM()").first    
  end

  def favorites
    @favorite_quotes = current_user.quotes
    puts @favorite_quotes 
  end
end