UpHex::Web.controllers do
  helpers ConditionalCommentsHelper

  get "/:id" do
    render "pages/#{params[:id]}"
  end
end
