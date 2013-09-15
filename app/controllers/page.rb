UpHex::Web.controllers do
  helpers ConditionalCommentsHelper

  get "/CloudHealthCheck" do
    status 200
    body ''
  end

  get "/:id" do
    render "pages/#{params[:id]}"
  end
end
