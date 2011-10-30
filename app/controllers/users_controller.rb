# -*- coding: utf-8 -*-
class UsersController < ApplicationController
#  before_filter :require_no_user, :only => [ :create, :new]
  before_filter :require_user, :only => [:show, :edit, :update, :create, :new]

  def index
    @users = User.all
  end

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
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def change_password
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'Cuenta actualizada.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end
end
