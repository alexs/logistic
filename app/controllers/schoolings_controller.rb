class SchoolingsController < ApplicationController
  # GET /schoolings
  # GET /schoolings.xml
  def index
    @schoolings = Schooling.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @schoolings }
    end
  end

  # GET /schoolings/1
  # GET /schoolings/1.xml
  def show
    @schooling = Schooling.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @schooling }
    end
  end

  # GET /schoolings/new
  # GET /schoolings/new.xml
  def new
    @schooling = Schooling.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @schooling }
    end
  end

  # GET /schoolings/1/edit
  def edit
    @schooling = Schooling.find(params[:id])
  end

  # POST /schoolings
  # POST /schoolings.xml
  def create
    @schooling = Schooling.new(params[:schooling])

    respond_to do |format|
      if @schooling.save
        format.html { redirect_to(@schooling, :notice => 'Schooling was successfully created.') }
        format.xml  { render :xml => @schooling, :status => :created, :location => @schooling }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @schooling.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /schoolings/1
  # PUT /schoolings/1.xml
  def update
    @schooling = Schooling.find(params[:id])

    respond_to do |format|
      if @schooling.update_attributes(params[:schooling])
        format.html { redirect_to(@schooling, :notice => 'Schooling was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @schooling.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /schoolings/1
  # DELETE /schoolings/1.xml
  def destroy
    @schooling = Schooling.find(params[:id])
    @schooling.destroy

    respond_to do |format|
      format.html { redirect_to(schoolings_url) }
      format.xml  { head :ok }
    end
  end
end
