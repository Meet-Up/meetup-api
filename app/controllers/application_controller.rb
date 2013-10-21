class ApplicationController < ActionController::API
  include ActionController::StrongParameters

  before_action :set_headers

  def render_404
    render json: { error: 'not found'}.to_json, status: 404
  end

  def render_403
    render json: { error: 'not authorized'}.to_json, status: 403
  end

  def cors_preflight_check
    head :no_content
  end

  def save_or_fail!(entity)
    if entity.save
      render json: entity, status: 201
    else
      render json: entity, status: :unprocessable_entity
    end
  end

  private
  def set_headers
    origin_regex = Regexp.new(Settings.cors.origin_regex, Regexp::IGNORECASE)
    if request.headers["HTTP_ORIGIN"] && origin_regex.match(request.headers["HTTP_ORIGIN"])
      headers['Access-Control-Allow-Origin'] = request.headers["HTTP_ORIGIN"]
      headers['Access-Control-Expose-Headers'] = 'ETag'
      headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
      headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match,Auth-User-Token'
      headers['Access-Control-Max-Age'] = '86400'
      headers['Access-Control-Allow-Credentials'] = 'true'
    end
  end
end
