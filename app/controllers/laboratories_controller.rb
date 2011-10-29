class LaboratoriesController < ApplicationController
  # GET /laboratories
  # GET /laboratories.xml
  def index
    @laboratories = Laboratory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @laboratories }
    end
  end

  # GET /laboratories/1
  # GET /laboratories/1.xml
  def show
    @laboratory = Laboratory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @laboratory }
    end
  end

  # GET /laboratories/new
  # GET /laboratories/new.xml
  def new
    @laboratory = Laboratory.new(:appoiment_id => params[:id])
  end


  # GET /laboratories/1/edit
  def edit
    @laboratory = Laboratory.find(params[:id])
  end

  # POST /laboratories
  # POST /laboratories.xml
  def create
    @laboratory = Laboratory.new(params[:laboratory])

    respond_to do |format|
      if @laboratory.save
        format.html { redirect_to(@laboratory, :notice => 'Laboratory was successfully created.') }
        format.xml  { render :xml => @laboratory, :status => :created, :location => @laboratory }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @laboratory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /laboratories/1
  # PUT /laboratories/1.xml
  def update
    @laboratory = Laboratory.find(params[:id])

    respond_to do |format|
      if @laboratory.update_attributes(params[:laboratory])
        format.html { redirect_to(@laboratory, :notice => 'Laboratory was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @laboratory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /laboratories/1
  # DELETE /laboratories/1.xml
  def destroy
    @laboratory = Laboratory.find(params[:id])
    @laboratory.destroy

    respond_to do |format|
      format.html { redirect_to(laboratories_url) }
      format.xml  { head :ok }
    end
  end
end
