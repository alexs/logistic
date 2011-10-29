class FirstTimesController < ApplicationController
  def index
    @first_times = FirstTime.find_all_by_patient_id(params[:id])
    @patient = params[:id]

    respond_to do |format|
      format.js
    end
  end

  def show
    @first_time = FirstTime.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def new
   @first_time = FirstTime.new(:patient_id => params[:id], :somatometry_id => Somatometry.find_last_by_patient_id_and_date(params[:id],Date.today).id)
  end

  def edit
    @first_time = FirstTime.find(params[:id])
  end

  def create
    @first_time = FirstTime.new(params[:first_time])

    respond_to do |format|
      if @first_time.save
        format.js { render :action => "create" }
      else
        format.js { render :action => "new" }
      end
    end
  end

  def update
    @first_time = FirstTime.find(params[:id])

    respond_to do |format|
      if @first_time.update_attributes(params[:first_time])
        format.html { redirect_to(@first_time, :notice => 'FirstTime was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @first_time = FirstTime.find(params[:id])
    @first_time.destroy

    respond_to do |format|
      format.html { redirect_to(first_times_url) }
    end
  end
end
