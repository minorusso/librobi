class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    # ログイン済ユーザーのみにアクセスを許可する
    before_action :authenticate_user!,except: [:top]
    before_action :configure_permitted_parameters, if: :devise_controller?
    def after_sign_in_path_for(resource)
        posts_path
    end
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        # アカウント編集の時にnameのストロングパラメータを追加
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
