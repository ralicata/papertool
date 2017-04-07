class PagesController < ApplicationController
  def index
  end

  def page_pdf
    @square_size = params[:sq].to_i || 10
  end

end
