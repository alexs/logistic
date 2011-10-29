class SocioeconomicsController < ApplicationController
  # GET /socioeconomics
  # GET /socioeconomics.xml
  def index
    @socioeconomics = Socioeconomic.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @socioeconomics }
    end
  end

  def show
    @socioeconomic = Socioeconomic.find_last_by_patient_id(params[:id])

    respond_to do |format|
      format.js
    end
  end

  # GET /socioeconomics/new
  # GET /socioeconomics/new.xml
  def new
    @socioeconomic = Socioeconomic.new(:patient_id => params[:id])
    respond_to do |format|
      format.js
    end
  end

  # GET /socioeconomics/1/edit
  def edit
    @socioeconomic = Socioeconomic.find(params[:id])
  end

  # POST /socioeconomics
  # POST /socioeconomics.xml
  def create
    @socioeconomic = Socioeconomic.new(params[:socioeconomic])

    respond_to do |format|
      if @socioeconomic.save
        format.js { render :action => "create" }
      else
        format.js { render :action => "new" }
      end
    end
  end

  # PUT /socioeconomics/1
  # PUT /socioeconomics/1.xml
  def update
    @socioeconomic = Socioeconomic.find(params[:id])

    respond_to do |format|
      if @socioeconomic.update_attributes(params[:socioeconomic])
        format.html { redirect_to(@socioeconomic, :notice => 'Socioeconomic was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @socioeconomic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /socioeconomics/1
  # DELETE /socioeconomics/1.xml
  def destroy
    @socioeconomic = Socioeconomic.find(params[:id])
    @socioeconomic.destroy

    respond_to do |format|
      format.html { redirect_to(socioeconomics_url) }
      format.xml  { head :ok }
    end
  end
end
