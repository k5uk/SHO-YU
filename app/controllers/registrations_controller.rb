class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    root_path
  end

  def after_update_path_for(resource)
    current_user
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