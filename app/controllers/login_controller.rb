# Encoding: UTF-8
class LoginController < ApplicationController
  before_filter :find_user, :except => [:index, :new, :create, :list]
  def new
    @user = Login.new
  end

  def show 
	  if params[:id]
		  @products = Product.find :all, :conditions => ['login_id = ?', params[:id]] 
	  else
		  @products = Product.find(:all)
	  end
  end

  def list
    @users = Login.find(:all, :order => "firstname")
  end

  def edit
  end

  def create
    @user = Login.new(params[:user])
    
    if @user.save
      @current_user = @user
      session[:user] = @user.id
      flash[:notice] = "Sikeres bejelentkezés"
      redirect_to :action => "show", :id => @user.id
    else
      render :action => "new"
    end
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Sikeres frissítés"
      redirect_to :action => "show", :id => @user.id
    else
      render :action => "edit"
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "Felhasználó törötve"
    redirect_to :action => "index"
  end
  
  private
  def find_user
    @user=Login.find(params[:id])
  end
end