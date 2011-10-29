class Ultra3SoundsController < ApplicationController
  def index
    @ultra3_sounds = Ultra3Sound.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ultra3_sounds }
    end
  end

  def show
    @ultra3_sound = Ultra3Sound.find_last_by_patient_id(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def new
    @ultra3_sound = Ultra3Sound.new(:patient_id => params[:id])
  end

  def edit
    @ultra3_sound = Ultra3Sound.find(params[:id])
  end

  def create
    @ultra3_sound = Ultra3Sound.new(params[:ultra3_sound])

   respond_to do |format|
      if @ultra3_sound.save
        format.js { render :action => "create" }
      else
        format.js { render :action => "new" }
      end
    end
  end

  def update
    @ultra3_sound = Ultra3Sound.find(params[:id])

    respond_to do |format|
      if @ultra3_sound.update_attributes(params[:ultra3_sound])
        format.html { redirect_to(@ultra3_sound, :notice => 'Ultra3Sound was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end


  def destroy
    @ultra3_sound = Ultra3Sound.find(params[:id])
    @ultra3_sound.destroy

    respond_to do |format|
      format.html { redirect_to(ultra3_sounds_url) }
      format.xml  { head :ok }
    end
  end
end
