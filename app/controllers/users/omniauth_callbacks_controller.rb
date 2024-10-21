
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def keycloakopenid
    Rails.logger.debug(request.env["omniauth.auth"])

    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      flash_alert @user.errors.full_messages
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end

end


