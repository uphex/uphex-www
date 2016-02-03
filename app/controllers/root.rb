UpHex::Web.controllers do
  get "/" do
    @app_host = settings.app_host
    
    render "pages/index"
  end
end
