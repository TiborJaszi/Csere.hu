# Encoding: UTF-8
class ProductController < ApplicationController
  before_filter :find_product, :except => [:index, :add, :create, :list, :own]
  def new
    @product = Product.new
  end

  def edit
  end

  def index
    @products = Product.find(:all, :order => "add_price")
  end

  def show
   @kie = Login.find_by_id(@product.login_id, :select =>"firstname,lastname,id")
  end

  def create
    handle_image_upload(params)
    @product = Product.new(params[:product])
    
    
    if @product.save
      flash[:msg] = "Sikeresen hozzáadva"
      redirect_to :action => "show", :id => @product.id
    else
      render :action => "new"
    end
  end
  
  def update
    handle_image_upload(params)
    if @product.update_attributes(params[:product])
      flash[:msg] = "Sikeres frissítés"
      redirect_to :action => "show", :id => @product.id
    else
      render :action => "edit"
    end
  end

  def destroy
    @product.destroy
    flash[:msg] = "Termék törötve"
    redirect_to :action => "index"
  end
  
  private
  def find_product
    @product=Product.find(params[:id])
  end
  private

  def handle_image_upload(params)
    if params[:add_pic]
      uploaded_io = params[:add_pic]
      File.open(Rails.root.join('public', 'images','products',
          uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      params[:product]['add_pic'] = uploaded_io.original_filename
    end
  end
end