module CompassInitializer
  def self.registered(app)
    require 'sass/plugin/rack'

    Compass.configuration do |config|
      config.project_path         = Padrino.root
      config.project_type         = :stand_alone
      config.output_style         = :compressed

      config.http_path            = "/"
      config.sass_dir             = "app/assets/stylesheets"
      config.images_dir           = "app/assets/images"
      config.http_images_path     = "/images"
      config.css_dir              = "public/stylesheets"
      config.javascripts_dir      = "public/javascripts"

      config.on_stylesheet_error do |f, m|
        puts "---- error in #{f}"
        puts m
      end
    end

    Compass.configure_sass_plugin!
    Compass.handle_configuration_change!

    app.use Sass::Plugin::Rack
  end
end
