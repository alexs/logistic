class VisitsController < ApplicationController
  # GET /visits
  # GET /visits.xml
  def index
    @institutions = Institution.find(:all, :order => 'name')

    respond_to do |format|
      format.html # index.html.erb

    end
  end

  def download_report1
      title = "reporte1.xls"
      GenerateSheet.report1
      send_file "#{::Rails.root.to_s}/public/excel/#{title}", :type => 'application/vnd.ms-excel', :filename => title
  end

  def download_report2
      title = "instituciones_sin_registro.xls"
      GenerateSheet.report2
      send_file "#{::Rails.root.to_s}/public/excel/#{title}", :type => 'application/vnd.ms-excel', :filename => title
  end

  def download_report3
      title = "instituciones_con_solicitud.xls"
      GenerateSheet.report3
      send_file "#{::Rails.root.to_s}/public/excel/#{title}", :type => 'application/vnd.ms-excel', :filename => title
  end

  def download_report4
      title = "instituciones_visitadas.xls"
      GenerateSheet.report4
      send_file "#{::Rails.root.to_s}/public/excel/#{title}", :type => 'application/vnd.ms-excel', :filename => title
  end

  def download_report5
      title = "actividades_seleccionadas.xls"
      GenerateSheet.report5
      send_file "#{::Rails.root.to_s}/public/excel/#{title}", :type => 'application/vnd.ms-excel', :filename => title
  end


  # GET /visits/1
  # GET /visits/1.xml
  def show
    @visit = Visit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @visit }
    end
  end

  def new
    @visit = Visit.new(:patient_id => params[:id])

    respond_to do |format|
      format.js
    end
  end

  # GET /visits/1/edit
  def edit
    @visit = Visit.find(params[:id])
  end

  # POST /visits
  # POST /visits.xml
  def create
    @visit = Visit.new(params[:visit])

    respond_to do |format|
      if @visit.save
        format.js {render :action => "create" }
      else
        format.js {render :action => "new" }
      end
    end
  end

  # PUT /visits/1
  # PUT /visits/1.xml
  def update
    @visit = Visit.find(params[:id])

    respond_to do |format|
      if @visit.update_attributes(params[:visit])
        format.html { redirect_to(@visit, :notice => 'Visit was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @visit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /visits/1
  # DELETE /visits/1.xml
  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy

    respond_to do |format|
      format.html { redirect_to(visits_url) }
      format.xml  { head :ok }
    end
  end
end
