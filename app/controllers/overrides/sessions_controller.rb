class Overrides::SessionsController < Devise::SessionsController
  # POST /resource/sign_in
  def create
    super
    flash[:notice] = "Привет, #{current_user.first_name} #{current_user.last_name}"
  end
end
