class OutjsonController < ApplicationController
  
  def hello

  end

  def index

  end

  def show
  	@product = Product.find(2)
  	respond_to do |format|
  	  format.html
  		format.json
  		
  	end



  end

end
