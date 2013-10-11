class ApplicationController < ActionController::API
  include ActionController::StrongParameters

  def render_404
    render json: { error: 'not found'}.to_json, status: 404
  end

  def render_403
    render json: { error: 'not authorized'}.to_json, status: 403
  end
end
