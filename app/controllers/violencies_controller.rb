class ViolenciesController < ApplicationController
  # GET /violencies
  # GET /violencies.xml
  def index
    @violencies = Violency.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @violencies }
    end
  end

  # GET /violencies/1
  # GET /violencies/1.xml
  def show
    @violency = Violency.find_last_by_patient_id(params[:id])

    respond_to do |format|
      format.js
    end
  end

  # GET /violencies/new
  # GET /violencies/new.xml
  def new
    @violency = Violency.new(:patient_id => params[:id])
  end

  # GET /violencies/1/edit
  def edit
    @violency = Violency.find(params[:id])
  end

  # POST /violencies
  # POST /violencies.xml
  def create
    @violency = Violency.new(params[:violency])

    respond_to do |format|
      if @violency.save
        format.js { render :action => "create" }
      else
        format.js { render :action => "new" }
      end
    end
  end

  # PUT /violencies/1
  # PUT /violencies/1.xml
  def update
    @violency = Violency.find(params[:id])

    respond_to do |format|
      if @violency.update_attributes(params[:violency])
        format.html { redirect_to(@violency, :notice => 'Violency was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @violency.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /violencies/1
  # DELETE /violencies/1.xml
  def destroy
    @violency = Violency.find(params[:id])
    @violency.destroy

    respond_to do |format|
      format.html { redirect_to(violencies_url) }
      format.xml  { head :ok }
    end
  end
end
