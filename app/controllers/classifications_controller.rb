class ClassificationsController < ApplicationController
  # GET /classifications
  # GET /classifications.xml
  def index
    @classifications = Classification.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @classifications }
    end
  end

  # GET /classifications/1
  # GET /classifications/1.xml
  def show
    @classification = Classification.find_by_patient_id(params[:id])

    respond_to do |format|
      format.js
    end
  end

  # GET /classifications/new
  # GET /classifications/new.xml
  def new
    @classification = Classification.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @classification }
    end
  end

  def edit
    @classification = Classification.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def create
    @classification = Classification.new(params[:classification])

    respond_to do |format|
      if @classification.save
        format.html { redirect_to(@classification, :notice => 'Classification was successfully created.') }
        format.xml  { render :xml => @classification, :status => :created, :location => @classification }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @classification.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @classification = Classification.find(params[:id])

    respond_to do |format|
      if @classification.update_attributes(params[:classification])
        format.js { render :action => "create" }
      else
        format.js { render :action => "edit" }
      end
    end
  end

  # DELETE /classifications/1
  # DELETE /classifications/1.xml
  def destroy
    @classification = Classification.find(params[:id])
    @classification.destroy

    respond_to do |format|
      format.html { redirect_to(classifications_url) }
      format.xml  { head :ok }
    end
  end
end
