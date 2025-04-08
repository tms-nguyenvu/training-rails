
class ApplicationController < ActionController::Base

  # binding.pry
  # Include it in the controllers (e.g. application_controller.rb)
  include Pagy::Backend

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found
  rescue_from ActionController::RoutingError, with: :handle_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid
  rescue_from Exception, with: :handle_exception


  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  protect_from_forgery with: :null_session
  allow_browser versions: :modern
  def after_sign_in_path_for(resource)
    # binding.pry
    if resource.has_role?(:admin)
      admin_posts_path
    else
      root_path
    end
  end

  private

    def handle_exception(exception)
      # Log error
      Rails.logger.error(exception.message)
      Rails.logger.error(exception.backtrace.join("\n"))

      # Notify service monitoring
      Sentry.capture_exception(exception) if Rails.env.production?

      # Render error page
      respond_to do |format|
        format.html { render 'errors/500', status: 500 }
        format.json { render json: { error: 'Internal Server Error' }, status: 500 }
      end
    end

    def handle_not_found(exception)
      respond_to do |format|
        format.html { render 'errors/404', status: :not_found }
        format.json { render json: { error: 'Resource not found' }, status: :not_found }
      end
    end

    def handle_invalid(exception)
      render json: { error: exception.record.errors.full_messages }, status: :unprocessable_entity
    end


end
