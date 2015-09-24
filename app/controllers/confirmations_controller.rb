class ConfirmationsController < Devise::ConfirmationsController

    # The path used after confirmation.
    def after_confirmation_path_for(resource_name, resource)
      if signed_in?(resource_name)
        signed_in_root_path(resource)
      else
        comfirm_path(resource_name)
      end
    end
    
end