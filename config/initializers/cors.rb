
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # Esto es de donde viene la petición: la ip de la app de react por ejemplo.
    # origins "http://127.0.0.1:5173"
    origins "http://localhost:5173"

    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
