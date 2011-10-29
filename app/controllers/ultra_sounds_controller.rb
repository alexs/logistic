class UltraSoundsController < ApplicationController
  # GET /ultra_sounds
  # GET /ultra_sounds.xml
  def index
    @ultra_sounds = UltraSound.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ultra_sounds }
    end
  end

  # GET /ultra_sounds/1
  # GET /ultra_sounds/1.xml
  def show
    @ultra_sound = UltraSound.find_last_by_patient_id(params[:id])

    respond_to do |format|
      format.js
    end
  end

  # GET /ultra_sounds/new
  # GET /ultra_sounds/new.xml
  def new
    @ultra_sound = UltraSound.new(:patient_id => params[:id])
  end
  
  # GET /ultra_sounds/1/edit
  def edit
    @ultra_sound = UltraSound.find(params[:id])
  end

  # POST /ultra_sounds
  # POST /ultra_sounds.xml
  def create
    @ultra_sound = UltraSound.new(params[:ultra_sound])

    respond_to do |format|
      if @ultra_sound.save
        format.js { render :action => "create" }
      else
        format.js { render :action => "new" }
      end
    end
  end

 def create2
    @ultra_sound = UltraSound.new(params[:ultra_sound])

    respond_to do |format|
      if @ultra_sound.save
        format.js { render :action => "create" }
      else
        format.js { render :action => "new2" }
      end
    end
  end

 def create3
    @ultra_sound = UltraSound.new(params[:ultra_sound])

    respond_to do |format|
      if @ultra_sound.save
        format.js { render :action => "create" }
      else
        format.js { render :action => "new3" }
      end
    end
  end

  # PUT /ultra_sounds/1
  # PUT /ultra_sounds/1.xml
  def update
    @ultra_sound = UltraSound.find(params[:id])

    respond_to do |format|
      if @ultra_sound.update_attributes(params[:ultra_sound])
        format.html { redirect_to(@ultra_sound, :notice => 'UltraSound was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ultra_sound.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ultra_sounds/1
  # DELETE /ultra_sounds/1.xml
  def destroy
    @ultra_sound = UltraSound.find(params[:id])
    @ultra_sound.destroy

    respond_to do |format|
      format.html { redirect_to(ultra_sounds_url) }
      format.xml  { head :ok }
    end
  end
end
