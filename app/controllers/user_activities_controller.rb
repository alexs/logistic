class UserActivitiesController < ApplicationController
  # GET /user_activities
  # GET /user_activities.xml
  def index
    @user_activities = UserActivity.find_all_by_user_id(current_user)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @user_activity = UserActivity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @user_activity = UserActivity.new

    respond_to do |format|
      format.html
    end
  end


  def edit
    @user_activity = UserActivity.find(params[:id])
  end

  def create
    @activities = params[:activity]

    @activities.each_value do |activity|
      @date = '2011-11-' + params[:date][activity.to_s]

      @hora_inicio = params[:start_hour][activity.to_s]+":"+params[:start_minute][activity.to_s]
      @hora_fin = params[:end_hour][activity.to_s]+":"+params[:end_minute][activity.to_s]
      @desc = params[:activity_desc][activity.to_s]

      @user_activity = UserActivity.new(:user_id => current_user.id, :activity_id => activity, :date  => "#{@date}", :start_hour => "#{Time.parse(@hora_inicio)}", :end_hour => "#{Time.parse(@hora_fin)}", :desc => @desc, :status => 1)
      if @user_activity.save
      else
      end
    end

    # @user_activity = UserActivity.new(params[:user_activity])

    respond_to do |format|
    #   if @user_activity.save
    format.html { redirect_to(user_activities_url, :notice => 'Se han registrado los datos, verificalos en la seccion: Actividades -> Mis actividades') }
    #   else
    #     format.html { render :action => "new" }
    #   end
    end
  end



  def update
    @user_activity = UserActivity.find(params[:id])

    respond_to do |format|
      if @user_activity.update_attributes(params[:user_activity])
        format.html { redirect_to(@user_activity, :notice => 'UserActivity was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_activities/1
  # DELETE /user_activities/1.xml
  def destroy
    @user_activity = UserActivity.find(params[:id])
    @user_activity.destroy

    respond_to do |format|
      format.html { redirect_to(user_activities_url) }
      format.xml  { head :ok }
    end
  end
end
