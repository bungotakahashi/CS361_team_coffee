class HomeController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  def index
  	if user_signed_in?
  		redirect_to :action => "show"
  	end
  end

  def show
  end

  def subscription
  	@user=User.find(params[:user_id])

  end

  def subscription_create
  	@x=payment_params
  	@user = User.find(payment_params[:id])
  	@user.update_attributes(payment_params) 
  	redirect_to :action => "show"	
  end
  def camp_new
    @camp=Camp.new
  end
  def camp_create
    @camp=Camp.new(camp_params)

    respond_to do |format|
        if @camp.save
          format.html {flash[:notice] =redirect_to action: "camp", notice: "New camp was added successfully."}
        else
           format.html {redirect_to :action => "camp_new"}
        end
    end
    
  end
  def camp
    @camp=Camp.where(userid: current_user.id).all
  end
  def camp_details
    @camp=Camp.find(params[:id])
    @outbreak=Outbreak.where(campid: params[:id]).all
    @food=Food.where(campid: params[:id]).all
    @medicine=Medicine.where(campid: params[:id]).all
  end

  def outbreak_new
    @outbreak=Outbreak.new
    @camp=Camp.find(params[:campid])
  end
  def outbreak_create
    @outbreak=Outbreak.new(outbreak_params)

    respond_to do |format|
        if @outbreak.save
          format.html {flash[:notice] =redirect_to action: "camp_details", id: @outbreak.campid}
        else
           format.html {redirect_to :action => "outbreak_new"}
        end
    end
    
  end

  def food_new
    @food=Food.new
    @camp=Camp.find(params[:campid])
  end
  def food_create
    @food=Food.new(food_params)

    respond_to do |format|
        if @food.save
          format.html {flash[:notice] =redirect_to action: "camp_details", id: @food.campid}
        else
           format.html {redirect_to :action => "food_new"}
        end
    end
    
  end
  def medicine_new
    @medicine=Medicine.new
    @camp=Camp.find(params[:campid])
  end
  def medicine_create
    @medicine=Medicine.new(medicine_params)

    respond_to do |format|
        if @medicine.save
          format.html {flash[:notice] =redirect_to action: "camp_details", id: @medicine.campid}
        else
           format.html {redirect_to :action => "medicine_new"}
        end
    end
    
  end
private
  def payment_params
		params.require(:user).permit(:id, :paymentMethod)
  end
  def camp_params
    params.require(:camp).permit(:userid, :name)
  end
  def outbreak_params
    params.require(:outbreak).permit(:campid, :name)
  end
  def food_params
    params.require(:food).permit(:campid, :name)
  end
    def medicine_params
    params.require(:medicine).permit(:campid, :name)
  end
end
