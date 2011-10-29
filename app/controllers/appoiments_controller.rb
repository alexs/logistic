class AppoimentsController < ApplicationController
  # GET /appoiments
  # GET /appoiments.xml
  def index
    @appoiments = Appoiment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @appoiments }
    end
  end

  # GET /appoiments/1
  # GET /appoiments/1.xml
  def show
    @appoiment = Appoiment.find(params[:id])

    respond_to do |format|
      format.js {render :action => 'get_appointment'}
    end
  end

  # GET /appoiments/new
  # GET /appoiments/new.xml
  def new
    @appoiment = Appoiment.new(:patient_id => params[:id] )
    
  end
  

  # GET /appoiments/1/edit
  def edit
    @appoiment = Appoiment.find(params[:id])
  end

  # POST /appoiments
  # POST /appoiments.xml
  def create
    @appoiment = Appoiment.new(params[:appoiment])

    respond_to do |format|
      if @appoiment.save
       
        format.xml  { render :xml => @appoiment, :status => :created, :location => @appoiment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @appoiment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /appoiments/1
  # PUT /appoiments/1.xml
  def update
    @appoiment = Appoiment.find(params[:id])

    respond_to do |format|
      if @appoiment.update_attributes(params[:appoiment])
        format.html { redirect_to(@appoiment, :notice => 'Appoiment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @appoiment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /appoiments/1
  # DELETE /appoiments/1.xml
  def destroy
    @appoiment = Appoiment.find(params[:id])
    @appoiment.destroy

    respond_to do |format|
      format.html { redirect_to(appoiments_url) }
      format.xml  { head :ok }
    end
  end
end
