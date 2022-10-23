class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :config_devise_params, if: :devise_controller?
  
  layout :layout_by_resource

  private

    def member_controller?
      controller_path != "home"
    end

    def layout_by_resource
      case
      when devise_controller? then "session"
      when member_controller? then "member"
      else
        "application"
      end
    end

  protected

  def config_devise_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :first_name,
      :last_name,
      :username,
      :email,
      :password,
      :password_confirmation
    ])
  end

  def set_locale
    return unless current_user
    I18n.locale = current_user.locale
  end
end
