class PagesController < ApplicationController
  def index
  end

  def page_pdf
    @square_size = 10
    @type = params.fetch(:tp, "squares")
    if !params[:sq].nil? && !params[:sq].blank?
      @square_size = params[:sq].to_i
    end
    @name = "#{@square_size}mm #{@type}"
    @header_h1 = (!params[:h1].nil? && !params[:h1].blank?) ? params[:h1] :  "Date: "
    @header_body = (!params[:body].nil? && !params[:body].blank?) ? params[:body] :  "page n°:"

  end

end
