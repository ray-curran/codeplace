class RegistrationsController < Devise::RegistrationsController  

 private  

 def sign_up_params  
        params.require(:user).permit(:email, :password, :time_zone)  
    end  

    # also add the current_password  
 def account_update_params  
     params.require(:user).permit(:email, :password, :time_zone, :current_password)  
 end  
  
end  