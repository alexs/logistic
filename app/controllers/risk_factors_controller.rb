class RiskFactorsController < ApplicationController
  # GET /risk_factors
  # GET /risk_factors.xml
  def index
    @risk_factors = RiskFactor.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @risk_factors }
    end
  end

  # GET /risk_factors/1
  # GET /risk_factors/1.xml
  def show
    @risk_factor = RiskFactor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @risk_factor }
    end
  end

  def new
    @risk_factor = RiskFactor.new(:patient_id => params[:id])
  end

  # GET /risk_factors/1/edit
  def edit
    @risk_factor = RiskFactor.find(params[:id])
  end

  # POST /risk_factors
  # POST /risk_factors.xml
  def create
    @risk_factor = RiskFactor.new(params[:risk_factor])

    respond_to do |format|
      if @risk_factor.save
        format.js { render :action => "create"}
      else
        format.js { render :action => "new"}
      end
    end
  end

  # PUT /risk_factors/1
  # PUT /risk_factors/1.xml
  def update
    @risk_factor = RiskFactor.find(params[:id])

    respond_to do |format|
      if @risk_factor.update_attributes(params[:risk_factor])
        format.html { redirect_to(@risk_factor, :notice => 'RiskFactor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @risk_factor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /risk_factors/1
  # DELETE /risk_factors/1.xml
  def destroy
    @risk_factor = RiskFactor.find(params[:id])
    @risk_factor.destroy

    respond_to do |format|
      format.html { redirect_to(risk_factors_url) }
      format.xml  { head :ok }
    end
  end
end
