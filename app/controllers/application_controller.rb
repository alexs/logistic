# -*- coding: utf-8 -*-
# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
 # before_filter :require_user
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  layout "application", :except => :user_sessions

 private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end
##Eliminar paciente no necesario por el momento
# def require_admin_patient
#          unless (current_user.group_id == 1 and current_user.group_id == 3)
#            store_location
#            flash[:notice] = "Solo Administradores pueden dar de  baja pacientes"
#            redirect_to :controller => 'patients', :action => 'index'
#          return false
#        end
#      end

     def require_admin
         unless current_user.group_id == 1 or current_user.group_id == 3 or current_user.id == 14
           store_location
           flash[:notice] = "Debes tener privilegios de administrador para ingresar al modulo de administracion todo abuso sera reportado a las autoridades correspondientes"
          # current_user_session.destroy
           redirect_to :controller => 'navigators', :action => 'index'
         return false
       end
     end


  def require_user
    unless current_user
      store_location
      flash[:notice] = "Debes ingresar tu usuario y contraseña para acceder a esa pagina todo abuso sera reportado a las autoridades correspondientes"
      redirect_to new_user_session_url
      return false
    end
  end

   def require_no_user
     if current_user
       store_location
#       flash[:notice] = "Debes ingresar tu usuario y contraseña"
       redirect_to :controller => 'navigators', :action => 'index'
       return false
     end
   end

 def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
