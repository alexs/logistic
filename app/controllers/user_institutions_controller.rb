class UserInstitutionsController < ApplicationController
  def index
    @user_institutions = UserInstitution.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_institutions }
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
      format.html # new.html.erb
      format.xml  { render :xml => @user_institution }
    end
  end

  # GET /user_institutions/1/edit
  def edit
    @user_institution = UserInstitution.find(params[:id])
  end

  def create
    @institutions = params[:institution]

    @institutions.each_value do |institution|
      @user_institution = UserInstitution.new(:user_id => params[:user_institution][:user_id], :institution_id => institution)
      @user_institution.save
    end

    # @user_institution = UserInstitution.new(params[:user_institution])

#    respond_to do |format|
    #   if @user_institution.save
    #     format.html { redirect_to(@user_institution, :notice => 'UserInstitution was successfully created.') }
    #   else
    #     format.html { render :action => "new" }
    #   end
    # end
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
