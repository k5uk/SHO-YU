class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    
        def facebook
            callback_from :facebook
        end
        
        private
            def callback_from(provider)
                provider = provider.to_s
                p "Requestちぇっく"
                p request.env['omniauth.auth']
                @user = User.find_for_oauth(request.env['omniauth.auth'])
                
                p "コントーラーてすと"
                p @user
                
                if @user.persisted?
                    p "ぱーしすてっどせいこう"
                    sign_in_and_redirect @user, eventr: :authentication
                else
                    p "ぱーしすてっどしっぱい"
                    session["devise.facebook.data"] = request.env["omniauth.auth"]
                    redirect_to new_user_registration_url
                end
            end
            
end