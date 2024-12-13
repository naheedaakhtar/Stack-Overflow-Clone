class UserCredsController < ApplicationController

  def moderate
    @user_creds = UserCred.where(approved: false)
  end

  def approve
    @user_cred = UserCred.find(params[:id])
    @user_cred.approved= true
    @user_cred.save()
    render moderate
  end

  def delete
    @user_cred = UserCred.find(params[:id])
    @user_cred.destroy()
  end

  def new
    @user_cred = UserCred.new()
  end

  def create
    @user_cred = UserCred.new(create_update_params)
    @user_cred.approved = false
    @user_cred.user_id = current_user.id
    respond_to do |format|
      if @user_cred.save
        format.html { redirect_to current_user, notice: 'Professor credential request created successfully'}
        format.json {redirect_to user_path(current_user), status: :created, location: @user_cred }
      else
        format.html do 
          flash[:alert] = 'Professor credential request could not be created'
          render :new, status: :unprocessable_content
        end
      end
    end
  end

  private
  
  def create_update_params    
    params.require(:user_cred).permit(:details, :name,:school)
  end

end
