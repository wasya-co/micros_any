
class ApplicationController < ActionController::Base

  def home
    # if !current_user
    #   redirect_to new_user_session_path
    #   return
    # end
  end

  def test_exception
    throw 'test exception'
  end

  ##
  ## private
  ##
  private

  ## v0.1.0
  def flash_alert what
    # puts! what, 'what'

    flash[:alert] ||= []
    if String == what.class
      str = what
    elsif Array == what.class
      what.each do |wha|
        flash[:alert] << wha
      end
    else
      str = "Cannot create/update #{what.class.name}: #{what.errors.full_messages.join(', ')} ."
      flash[:alert] << str
    end
  end

  def flash_notice what
    flash[:notice] ||= []
    if String == what.class
      str = what
    else
      str = "Created/updated #{what.class.name} ."
    end
    flash[:notice] << str
  end


end
