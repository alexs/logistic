class UserInstitutionsController < ApplicationController
  def index
    @user_institutions = UserInstitution.find_all_by_user_id(current_user)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @user_institution = UserInstitution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_institution }
    end
  end

  def new
    @user_institution = UserInstitution.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @user_institution = UserInstitution.find(params[:id])
  end

  def create
    @institutions = params[:institution]

    @institutions.each_value do |institution|
      @visit_date = '2011-11-' + params[:visit_date][institution.to_s]

      @hora = params[:hour_visit][institution.to_s]+":"+params[:minute_visit][institution.to_s]
      @team = params[:team][institution.to_s]

      @user_institution = UserInstitution.new(:user_id => current_user.id, :institution_id => institution, :date => Date.today, :visit_date  => "#{@visit_date}", :hour_visit => "#{Time.parse(@hora)}", :team => @team, :status => 1)
      if @user_institution.save
      else
      end
    end

    # @user_institution = UserInstitution.new(params[:user_institution])

    respond_to do |format|
    #   if @user_institution.save
    format.html { redirect_to(user_institutions_url, :notice => 'Se han registrado los datos, verificalos en la seccion: Instituciones -> Mis visitas') }
    #   else
    #     format.html { render :action => "new" }
    #   end
    end
  end

  # PUT /user_institutions/1
  # PUT /user_institutions/1.xml
  def update
    @user_institution = UserInstitution.find(params[:id])

    respond_to do |format|
      if @user_institution.update_attributes(params[:user_institution])
        format.html { redirect_to(@user_institution, :notice => 'UserInstitution was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_institution.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_institutions/1
  # DELETE /user_institutions/1.xml
  def destroy
    @user_institution = UserInstitution.find(params[:id])
    @user_institution.destroy

    respond_to do |format|
      format.html { redirect_to(user_institutions_url) }
      format.xml  { head :ok }
    end
  end
end
