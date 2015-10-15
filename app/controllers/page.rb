UpHex::Web.controllers do
  helpers MissingTemplateHandler

  get "/CloudHealthCheck" do
    status 200
    body ''
  end

  get "/:id" do
    with_missing_template_handling do
      render "pages/#{params[:id]}"
    end
  end
end
