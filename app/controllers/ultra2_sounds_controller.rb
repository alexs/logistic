class Ultra2SoundsController < ApplicationController
  # GET /ultra2_sounds
  # GET /ultra2_sounds.xml
  def index
    @ultra2_sounds = Ultra2Sound.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ultra2_sounds }
    end
  end

  # GET /ultra2_sounds/1
  # GET /ultra2_sounds/1.xml
  def show
    @ultra2_sound = Ultra2Sound.find_last_by_patient_id(params[:id])

    respond_to do |format|
      format.js
    end
  end

  # GET /ultra2_sounds/new
  # GET /ultra2_sounds/new.xml
  def new
   @ultra2_sound = Ultra2Sound.new(:patient_id => params[:id])
  end

  # GET /ultra2_sounds/1/edit
  def edit
    @ultra2_sound = Ultra2Sound.find(params[:id])
  end

  # POST /ultra2_sounds
  # POST /ultra2_sounds.xml
  def create
    @ultra2_sound = Ultra2Sound.new(params[:ultra2_sound])

    respond_to do |format|
      if @ultra2_sound.save
        format.js { render :action => "create" }
      else
        format.js { render :action => "new" }
      end
    end
     
  end

  # PUT /ultra2_sounds/1
  # PUT /ultra2_sounds/1.xml
  def update
    @ultra2_sound = Ultra2Sound.find(params[:id])

    respond_to do |format|
      if @ultra2_sound.update_attributes(params[:ultra2_sound])
        format.html { redirect_to(@ultra2_sound, :notice => 'Ultra2Sound was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ultra2_sound.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ultra2_sounds/1
  # DELETE /ultra2_sounds/1.xml
  def destroy
    @ultra2_sound = Ultra2Sound.find(params[:id])
    @ultra2_sound.destroy

    respond_to do |format|
      format.html { redirect_to(ultra2_sounds_url) }
      format.xml  { head :ok }
    end
  end
end
