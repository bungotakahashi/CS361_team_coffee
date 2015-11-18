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

  def payment_params
		params.require(:user).permit(:id, :paymentMethod)
  end
end
