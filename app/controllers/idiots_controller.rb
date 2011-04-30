class IdiotsController < ApplicationController
  def new
    @idiot = Idiot.new

    respond_to do |format|
      format.html
    end
    
  end
  
  def create
    @idiot = Idiot.create(params[:idiot])
    
    respond_to do |format|
      if @idiot.save
        format.html {redirect_to @idiot, :notice => "ok"}
      else
        format.html {render :action => :new, :notice => "erro"}
      end
    end
  end
  
  def show
    @idiot = Idiot.find(params[:id])
    
    respond_to do |format|
      format.html
    end
  end

end
