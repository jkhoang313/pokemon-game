class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_trainer

  def current_trainer
    Trainer.find(session[:trainer_id]) if session[:trainer_id]
  end
end
