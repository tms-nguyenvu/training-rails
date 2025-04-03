
class Auth::RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      resource.add_role(:user) if resource.persisted?
    end
  end
end
