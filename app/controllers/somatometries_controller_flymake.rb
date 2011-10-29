class SomatometriesController < ApplicationController
  def show
    @somatometry = Somatometry.find_last_by_patient_id_and_date(params[:id],Date.today)

    respond_to do |format|
      format.js
    end
  end

  def new
    @somatometry = Somatometry.new(:patient_id => params[:id])

    respond_to do |format|
      format.js
    end
  end

  def create
    @somatometry = Somatometry.new(params[:somatometry])

    respond_to do |format|
      if @somatometry.save
        format.js { render :action => "create" }
      else
        format.js { render :action => "new" }
      end
    end
  end
end
