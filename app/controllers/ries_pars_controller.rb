class RiesParsController < ApplicationController
  # GET /ries_pars
  # GET /ries_pars.xml
  def index
    @ries_pars = RiesPar.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ries_pars }
    end
  end

  # GET /ries_pars/1
  # GET /ries_pars/1.xml
  def show
    @ries_par = RiesPar.find_last_by_patient_id(params[:id])

    respond_to do |format|
      format.js
    end
  end

  # GET /ries_pars/new
  # GET /ries_pars/new.xml
  def new
    @ries_par = RiesPar.new(:patient_id => params[:id])
  end

  # GET /ries_pars/1/edit
  def edit
    @ries_par = RiesPar.find(params[:id])
  end

  # POST /ries_pars
  # POST /ries_pars.xml
  def create
    @ries_par = RiesPar.new(params[:ries_par])

    respond_to do |format|
      if @ries_par.save
        format.js { render :action => "create" }
      else
        format.js { render :action => "new" }
      end
    end
  end

  # PUT /ries_pars/1
  # PUT /ries_pars/1.xml
  def update
    @ries_par = RiesPar.find(params[:id])

    respond_to do |format|
      if @ries_par.update_attributes(params[:ries_par])
        format.html { redirect_to(@ries_par, :notice => 'RiesPar was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ries_par.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ries_pars/1
  # DELETE /ries_pars/1.xml
  def destroy
    @ries_par = RiesPar.find(params[:id])
    @ries_par.destroy

    respond_to do |format|
      format.html { redirect_to(ries_pars_url) }
      format.xml  { head :ok }
    end
  end
end
