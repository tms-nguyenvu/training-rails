
class Auth::RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      resource.add_role(:user) if resource.persisted?
    end
  end

  protected
    def after_inactive_sign_up_path_for(resource)
      new_user_session_path
    end
end
