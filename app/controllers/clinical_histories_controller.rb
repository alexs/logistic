class ClinicalHistoriesController < ApplicationController
  def index
    @clinical_histories = ClinicalHistory.all

    respond_to do |format|
      format.html
    end
  end

  def show
    @clinical_history = ClinicalHistory.find_last_by_patient_id(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def new
    @clinical_history = ClinicalHistory.new(:patient_id => params[:id])
    @clinical_history.past_pregnants.build

    respond_to do |format|
      format.js
    end
  end

  def edit
    @clinical_history = ClinicalHistory.find(params[:id])
  end

  def create
    @clinical_history = ClinicalHistory.new(params[:clinical_history])
    @probable_embarazo = @clinical_history.fum + 280
    @clinical_history.fecha_probable_parto = @probable_embarazo

    respond_to do |format|
      if @clinical_history.save
        format.js { render :action => "create" }
      else
        format.js { render :action => "new" }
      end
    end
  end

  def update
    @clinical_history = ClinicalHistory.find(params[:id])

    respond_to do |format|
      if @clinical_history.update_attributes(params[:clinical_history])
        format.html { redirect_to(@clinical_history, :notice => 'ClinicalHistory was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @clinical_history = ClinicalHistory.find(params[:id])
    @clinical_history.destroy

    respond_to do |format|
      format.html { redirect_to(clinical_histories_url) }
    end
  end
end
