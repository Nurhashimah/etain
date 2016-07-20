class UsersController < ApplicationController
   before_action :set_user, only: [:show, :edit, :update, :destroy, :match]
  #filter_resource_access

  def index
    @users = User.all
    @search = User.search(params[:q])
    @users = @search.result
  end

  def edit
  end
 
  def update
    #raise params.inspect
    respond_to do |format|
      if @user.update(user_params)
        if @user==current_user
          format.html { redirect_to root_path, notice: 'User was successfully updated.' }
        else
          format.html{redirect_to users_path, notice: 'Account details were successfully updated.'}
        end
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
      #flash.discard
      #flash.now[:notice]=
    end
  end
  
  def match
    @user=current_user
    @matched_company=Company.where(email: current_user.email)
    @matched_customer=Customer.where(email: current_user.email, corporate: true)
    @role_list=["administration", "trainer", "trainee"]
    @role_val=['1','0','0']
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :company_id, :college_id, :name, :roles, {:user_roles => [:administration, :trainer, :trainee]})
      #{:details => []}, :rate,
    end
end
