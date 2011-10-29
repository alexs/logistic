class SocioeconomicOcupationsController < ApplicationController
  # GET /socioeconomic_ocupations
  # GET /socioeconomic_ocupations.xml
  def index
    @socioeconomic_ocupations = SocioeconomicOcupation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @socioeconomic_ocupations }
    end
  end

  # GET /socioeconomic_ocupations/1
  # GET /socioeconomic_ocupations/1.xml
  def show
    @socioeconomic_ocupation = SocioeconomicOcupation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @socioeconomic_ocupation }
    end
  end

  # GET /socioeconomic_ocupations/new
  # GET /socioeconomic_ocupations/new.xml
  def new
    @socioeconomic_ocupation = SocioeconomicOcupation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @socioeconomic_ocupation }
    end
  end

  # GET /socioeconomic_ocupations/1/edit
  def edit
    @socioeconomic_ocupation = SocioeconomicOcupation.find(params[:id])
  end

  # POST /socioeconomic_ocupations
  # POST /socioeconomic_ocupations.xml
  def create
    @socioeconomic_ocupation = SocioeconomicOcupation.new(params[:socioeconomic_ocupation])

    respond_to do |format|
      if @socioeconomic_ocupation.save
        format.html { redirect_to(@socioeconomic_ocupation, :notice => 'SocioeconomicOcupation was successfully created.') }
        format.xml  { render :xml => @socioeconomic_ocupation, :status => :created, :location => @socioeconomic_ocupation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @socioeconomic_ocupation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /socioeconomic_ocupations/1
  # PUT /socioeconomic_ocupations/1.xml
  def update
    @socioeconomic_ocupation = SocioeconomicOcupation.find(params[:id])

    respond_to do |format|
      if @socioeconomic_ocupation.update_attributes(params[:socioeconomic_ocupation])
        format.html { redirect_to(@socioeconomic_ocupation, :notice => 'SocioeconomicOcupation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @socioeconomic_ocupation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /socioeconomic_ocupations/1
  # DELETE /socioeconomic_ocupations/1.xml
  def destroy
    @socioeconomic_ocupation = SocioeconomicOcupation.find(params[:id])
    @socioeconomic_ocupation.destroy

    respond_to do |format|
      format.html { redirect_to(socioeconomic_ocupations_url) }
      format.xml  { head :ok }
    end
  end
end
