class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_update_path_for(resource)
    current_user
  end
  
  def after_inactive_sign_up_path_for(resource)
    sending_path
  end
  
  # add calling update_without_current_password
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    if resource.update_without_current_password(account_update_params)
      yield resource if block_given?
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource, bypass: true
      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  private

      def sign_up_params
        params.require(:user).permit(:name, :email, :sex, :birthday, :area, :age,
        :kiryoku, :comment, :password, :password_confirmation)
      end
      
      def account_update_params
        params.require(:user).permit(:name, :email, :email_publish, :sex, :birthday, :age, :area, :kiryoku, :comment, 
        :password, :password_confirmation, :current_password, :image, :uid, :provider)
      end
      
end