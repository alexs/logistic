# -*- coding: utf-8 -*-
class UsersController < ApplicationController
  #before_filter :require_no_user, :only => [ :create, :new]
  #before_filter :require_user, :only => [:show, :edit, :update, :create, :new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Cuenta Registrada!"
      redirect_back_or_default user_url(@user)
    else
      render :action => :new
    end
  end

  def show
     @user = @current_user
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
    	    flash[:notice] = "Cuenta actualizada!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end
end
