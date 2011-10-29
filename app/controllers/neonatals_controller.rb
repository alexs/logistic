class NeonatalsController < ApplicationController
  def index
    @neonatals = Neonatal.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @neonatals }
    end
  end

  def show
    @neonatal = Neonatal.find_by_patient_id(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def new
    @neonatal = Neonatal.new(:patient_id => params[:id])

    respond_to do |format|
      format.js
    end
  end

  def edit
    @neonatal = Neonatal.find(params[:id])
  end

  def create
    @neonatal = Neonatal.new(params[:neonatal])

    respond_to do |format|
      if @neonatal.save
        format.js{render :action => "create" }
      else
        format.js{render :action => "new" }
      end
    end
  end

  def update
    @neonatal = Neonatal.find(params[:id])

    respond_to do |format|
      if @neonatal.update_attributes(params[:neonatal])
        format.html { redirect_to(@neonatal, :notice => 'Neonatal was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @neonatal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /neonatals/1
  # DELETE /neonatals/1.xml
  def destroy
    @neonatal = Neonatal.find(params[:id])
    @neonatal.destroy

    respond_to do |format|
      format.html { redirect_to(neonatals_url) }
      format.xml  { head :ok }
    end
  end
end
