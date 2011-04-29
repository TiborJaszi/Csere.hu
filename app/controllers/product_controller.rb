# Encoding: UTF-8
class ProductController < ApplicationController
  before_filter :find_product, :except => [:index, :add, :create, :list, :own, :aktivalas]
  before_filter :bejelentkezve
  def new
    @product = Product.new
  end
  
  def add
    @aktiv = Product.find_by_id(@current_user.aktiv, :select => "add_name,add_price,add_pic")
  end

  def edit
  end
  
  def aktivalas
    @user = Login.find_by_id(params["owner"])
    @user.update_attributes(:aktiv => params["id"])
    redirect_to :action => "index"
  end

  def index
    @products = Product.find(:all, :order => "add_price", :conditions => "login_id <> #{@current_user.id}")
    @aktiv = Product.find_by_id(@current_user.aktiv, :select => "add_name,add_price,add_pic")
  end

  def show
    @kie = Login.find_by_id(@product.login_id, :select =>"firstname,lastname,id,aktiv")
  end

  def create
    handle_image_upload(params)
    @product = Product.new(params[:product])
    
    
    if @product.save
      flash[:notice] = "Sikeresen hozzáadva"
      redirect_to :action => "show", :id => @product.id
    else
      render :action => "new"
    end
  end
  
  def update
    handle_image_upload(params)
    if @product.update_attributes(params[:product])
      flash[:notice] = "Sikeres frissítés"
      redirect_to :action => "show", :id => @product.id
    else
      render :action => "edit"
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = "Termék törötve"
    redirect_to :action => "index"
  end
  
  private
  def find_product
    @product=Product.find_by_id(params[:id])
  end
  
  private
  def bejelentkezve
    if !logged_in?
      redirect_to :controller => "login", :action => "index"
    end
  end
  
  private
  def handle_image_upload(params)
    if params[:product][:add_pic]
      uploaded_io = params[:product][:add_pic]
      dir = "public/images/products/"
      if !File.exists?(dir)
        Dir.Mkdir(dir)
      end
      File.open(Rails.root.join(dir, uploaded_io.original_filename), 'wb') do |file| file.write(uploaded_io.read)
      end
      params[:product]['add_pic'] = uploaded_io.original_filename
    end
  end
end