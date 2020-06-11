ActionController::Renderers.add :csv do |csv, options|
  filename = options[:filename] || csv.filename || 'data.csv'

  response.set_header('Content-Disposition', "attachment; filename=#{filename}")
  response.set_header('X-Accel-Buffering', 'no') # Prevent NGINX from buffering
  response.cache_control[:no_cache] = true # Prevent downstream caching
  response.content_type = Mime[:csv]
  response.body = csv
end
