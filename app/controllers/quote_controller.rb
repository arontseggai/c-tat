class QuoteController < ApplicationController
  skip_before_action :authenticate_user!, only: [:random]

  def random
    
  end
end