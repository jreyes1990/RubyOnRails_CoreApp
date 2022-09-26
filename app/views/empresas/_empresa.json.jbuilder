json.extract! empresa, :id, :nombre, :descripcion, :codigo_empresa, :user_created_id, :user_updated_id, :estado, :created_at, :updated_at
json.url empresa_url(empresa, format: :json)
