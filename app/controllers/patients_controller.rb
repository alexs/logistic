class PatientsController < ApplicationController
  def index
    @patient = Patient.new

    respond_to do |format|
      format.js { render :action => 'search_patient'}
    end
  end

  def show
    @patient = Patient.find(params[:id])

    respond_to do |format|
      format.html { render :partial => 'show' }
    end
  end


def appointments
@appointments = Appoiment.find(:all, :conditions => {:patient_id => params[:id]})
@patient = Patient.find(params[:id] )
  respond_to do |format|
    format.js { render :action => 'get_appointments'}
  end
end

  def new
    @patient = Patient.new
    respond_to do |format|
      format.js { render :action => 'new_form'}
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def create
    birthdate = {:year => params[:patient]['birthday(1i)'], :month =>   params[:patient]['birthday(2i)'], :day => params[:patient]['birthday(3i)']}
    key = Patient.new.keygen(params[:patient],  birthdate)
    @patient = Patient.new(params[:patient])

    if !@patient.square_id.nil? and @patient.square_id.to_i > 0
      @patient.cp = Square.find(@patient.square_id).cp.to_s
    end

    @patient.cuip = key
    @patient.lastname1 = @patient.lastname1.upcase
    @patient.firstname = @patient.firstname.upcase
    @patient.lastname2 = @patient.lastname2.upcase
    @patient.street = @patient.street.upcase

    ###### QUIIIIIITAAAAAAAAAARRRRRRRRRR SOLO PARA PRUEBAS ########33
    @patient.user_id = 1
    @patient.dependency_id = 1

    respond_to do |format|
      if @patient.save
        format.js {render :action => 'create.js.rjs', :notice => 'Patient was successfully created.'}
      else
        format.js {render :action => 'new_form.js.rjs'}
      end
    end
  end

  def update
    @patient = Patient.find(params[:id])

    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        format.html { redirect_to(@patient, :notice => 'Patient was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @patient.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to(patients_url) }
      format.xml  { head :ok }
    end
  end

  def select_state
    @counties = County.find(:all, :conditions => ['state_id = ?', params[:state_select]])
    return render(:partial => 'get_counties', :layout => false) if request.xhr?
  end

  def select_county
    @squares = Square.find(:all, :conditions => ['county_id = ?', params[:county_select]])
    return render(:partial => 'get_squares', :layout => false) if request.xhr?
  end

  def get_patient
    @patients = Patient.searcher(params[:patient]['search'])
    respond_to do |format|
      format.js   { render 'get_patient' }
    end
  end
end
