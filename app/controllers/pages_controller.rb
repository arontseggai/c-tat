class QuoteController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def random
  end
end
