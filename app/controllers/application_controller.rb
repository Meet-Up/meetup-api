class ApplicationController < ActionController::API
  include ActionController::StrongParameters
  def render_404
    render json: { error: 'not-found'}.to_json, status: 404
  end
end
