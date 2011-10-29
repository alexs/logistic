class OcupationsController < ApplicationController
  # GET /ocupations
  # GET /ocupations.xml
  def index
    @ocupations = Ocupation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ocupations }
    end
  end

  # GET /ocupations/1
  # GET /ocupations/1.xml
  def show
    @ocupation = Ocupation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ocupation }
    end
  end

  # GET /ocupations/new
  # GET /ocupations/new.xml
  def new
    @ocupation = Ocupation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ocupation }
    end
  end

  # GET /ocupations/1/edit
  def edit
    @ocupation = Ocupation.find(params[:id])
  end

  # POST /ocupations
  # POST /ocupations.xml
  def create
    @ocupation = Ocupation.new(params[:ocupation])

    respond_to do |format|
      if @ocupation.save
        format.html { redirect_to(@ocupation, :notice => 'Ocupation was successfully created.') }
        format.xml  { render :xml => @ocupation, :status => :created, :location => @ocupation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ocupation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ocupations/1
  # PUT /ocupations/1.xml
  def update
    @ocupation = Ocupation.find(params[:id])

    respond_to do |format|
      if @ocupation.update_attributes(params[:ocupation])
        format.html { redirect_to(@ocupation, :notice => 'Ocupation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ocupation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ocupations/1
  # DELETE /ocupations/1.xml
  def destroy
    @ocupation = Ocupation.find(params[:id])
    @ocupation.destroy

    respond_to do |format|
      format.html { redirect_to(ocupations_url) }
      format.xml  { head :ok }
    end
  end
end
