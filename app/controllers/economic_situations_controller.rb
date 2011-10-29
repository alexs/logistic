class EconomicSituationsController < ApplicationController
  # GET /economic_situations
  # GET /economic_situations.xml
  def index
    @economic_situations = EconomicSituation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @economic_situations }
    end
  end

  # GET /economic_situations/1
  # GET /economic_situations/1.xml
  def show
    @economic_situation = EconomicSituation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @economic_situation }
    end
  end

  # GET /economic_situations/new
  # GET /economic_situations/new.xml
  def new
    @economic_situation = EconomicSituation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @economic_situation }
    end
  end

  # GET /economic_situations/1/edit
  def edit
    @economic_situation = EconomicSituation.find(params[:id])
  end

  # POST /economic_situations
  # POST /economic_situations.xml
  def create
    @economic_situation = EconomicSituation.new(params[:economic_situation])

    respond_to do |format|
      if @economic_situation.save
        format.html { redirect_to(@economic_situation, :notice => 'EconomicSituation was successfully created.') }
        format.xml  { render :xml => @economic_situation, :status => :created, :location => @economic_situation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @economic_situation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /economic_situations/1
  # PUT /economic_situations/1.xml
  def update
    @economic_situation = EconomicSituation.find(params[:id])

    respond_to do |format|
      if @economic_situation.update_attributes(params[:economic_situation])
        format.html { redirect_to(@economic_situation, :notice => 'EconomicSituation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @economic_situation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /economic_situations/1
  # DELETE /economic_situations/1.xml
  def destroy
    @economic_situation = EconomicSituation.find(params[:id])
    @economic_situation.destroy

    respond_to do |format|
      format.html { redirect_to(economic_situations_url) }
      format.xml  { head :ok }
    end
  end
end
