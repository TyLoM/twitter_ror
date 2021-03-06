class MicropostsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy, :create]
  before_action :correct_user,   only: :destroy

  def create
      @micropost = current_user.microposts.build(micropost_params)
      if @micropost.save
        flash[:sucess] = "Micropost created"
        redirect_to root_url
      else
        render 'static_pages/home'
      end
  end
    def destroy
      @micropost.destroy
      flash[:success] = "Micropost deleted"
      redirect_to request.referrer || root_url
   end
  private

   def micropost_params
     params.require(:micropost).permit(:content)
   end

   def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
