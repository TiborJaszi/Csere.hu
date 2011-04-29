# Encoding: UTF-8
class LoginController < ApplicationController
  before_filter :find_user, :except => [:index, :new, :create, :list, :login, :logout]
  before_filter :bejelentkezve, :except => [:index, :create, :new, :login]
  
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
  
  def login
    @current_user = Login.authenticate(params[:user][:l_email],params[:user][:l_password])
    if @current_user
      session[:user]=@current_user.id
      flash[:notice] = "Sikeres bejelentkezés!"
      redirect_to :controller => "product", :action => "index"
    else
      flash[:notice] = "Hibás email vagy jelszó!"
      redirect_to :controller => "login", :action => "index"
    end
  end

  def logout
    reset_session
    flash[:notice] = "Sikeresen kijelentkezett! Viszont látásra!"
    redirect_to :controller => "login", :action => "index"
  end

  private
  def bejelentkezve
    if !logged_in?
      redirect_to :controller => "login", :action => "index"
    end
  end
  
  private
  def find_user
    @user=Login.find_by_id(params[:id])
  end
end