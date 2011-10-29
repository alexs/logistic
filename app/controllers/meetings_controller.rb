class MeetingsController < ApplicationController
  def index
   respond_to do |format|
      format.html
    end
  end

  def show
    @meeting = Meeting.find(params[:id])

    respond_to do |format|
      format.html
      format.xml  { render :xml => @meeting }
    end
  end

  def new
    @meeting = Meeting.new()
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def create
    @meeting = Meeting.new(params[:meeting])
  end

  def update
    @meeting = Meeting.find(params[:id])

    respond_to do |format|
      if @meeting.update_attributes(params[:meeting])
        format.html { redirect_to(@meeting, :notice => 'Meeting was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @meeting.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy

    respond_to do |format|
      format.html { redirect_to(meetings_url) }
      format.xml  { head :ok }
    end
  end

  def get_meetings
     @meetings = Meeting.find(:all, :conditions => ["starttime >= '#{Time.at(params['start'].to_i).to_formatted_s(:db)}'"])
    meetings = []
    @meetings.each do |meeting|
      meetings << {:id => meeting.id, :title => "Paciente Nombre", :description => "descripcion de la prueba" || "Some cool description here...", :start => "#{meeting.starttime.iso8601}", :end => "#{(meeting.starttime + 1.second).iso8601 }", :allDay => meeting.all_day}
    end
    render :text => meetings.to_json
  end
end
