class UsersController < ApplicationController
	def index
		@users=User.all
	end

	def new
    	@user = User.new
  	end

	def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Successfully Created "
      redirect_to @user
    else
      flash[:error] = "Error while updating user. Please try again"
      render action: "new"
    end
  	end

   	def show
    	@user = User.find(params[:id])
    		respond_to do |format|
     		format.html
   		end
  	end
	
	private 

	def user_params
		params.require(:user).permit(:name,:age,:gender)
	end
end