class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :user_signed_in?
    before_action :authenticate_user
    skip_before_action :verify_authenticity_token #to be used when using postman. Rails server sends a unique authenticity token every time it sends a form to the front end. When form is submitted from the front end, browser attaches that authenticity token back to the form which is then verified at the backend before the sent data is persisted to the database. As only browser can return the sent authenticity token back to the backend, we encounter CSRF (Cross Site Request Forgery) error while submitting data from the Postman (or any other medium other than the browser)
  
    def current_user
      @current_user ||= session[:user_id] && User.find_by(id: session[:user_id]) 
    end
  
    def user_signed_in?
      !current_user.nil?
    end
  
    def authenticate_user
      redirect_to new_session_path, flash: {danger: 'You must be signed in'} if current_user.nil?
    end
  
    def redirect_if_authenticated
      redirect_to root_path, flash: { info: 'You are already logged in.'} if user_signed_in?
    end
end
