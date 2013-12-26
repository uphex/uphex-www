module MissingTemplateHandler
  def with_missing_template_handling(&body)
    begin
      body.call
    rescue Padrino::Rendering::TemplateNotFound
      status 404
      render 'pages/index'
    end
  end
end
