class VariableFetalsController < ApplicationController
  def index
    @variable_fetals = VariableFetal.all

    respond_to do |format|
      format.html
    end
  end

  def show
    @variable_fetal = VariableFetal.find_last_by_patient_id(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def new
    @variable_fetal = VariableFetal.new(:patient_id => params[:id])
  end

  def edit
    @variable_fetal = VariableFetal.find(params[:id])
  end

  def create
    @variable_fetal = VariableFetal.new(params[:variable_fetal])

    respond_to do |format|
      if @variable_fetal.save
        format.js { render :action => "create" }
      else
        format.js { render :action => "new" }
      end
    end
  end

  def update
    @variable_fetal = VariableFetal.find(params[:id])

    respond_to do |format|
      if @variable_fetal.update_attributes(params[:variable_fetal])
        format.html { redirect_to(@variable_fetal, :notice => 'VariableFetal was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @variable_fetal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /variable_fetals/1
  # DELETE /variable_fetals/1.xml
  def destroy
    @variable_fetal = VariableFetal.find(params[:id])
    @variable_fetal.destroy

    respond_to do |format|
      format.html { redirect_to(variable_fetals_url) }
      format.xml  { head :ok }
    end
  end
end
