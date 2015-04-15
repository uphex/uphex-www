require 'sinatra/assetpack'

module UpHex
  module Initializers
    module AssetPackaging
      def self.registered(app)

        app.after do
          if request.url.end_with?('css')
            headers "Content-Type" => "text/css;charset=utf-8"
          end
        end

        app.register Sinatra::AssetPack

        app.assets {
          def relative_path(path)
            Pathname.new(path).relative_path_from(Pathname.new(app.root)).to_s
          end

          def app_relative_path(path)
            relative_path(File.expand_path("../../../#{path}", __FILE__))
          end

          def gem_relative_path(gem, path)
            relative_path(Gem::Specification.find_by_name(gem).gem_dir + path)
          end

          serve '/theme/scripts',     from: gem_relative_path("uphex-flatty", "/assets/javascripts")
          serve '/theme/stylesheets', from: gem_relative_path("uphex-flatty", "/assets/stylesheets")
          serve '/theme/fonts',       from: gem_relative_path("uphex-flatty", "/assets/fonts")

          serve '/assets/scripts',     from: app_relative_path("app/assets/javascripts")
          serve '/assets/stylesheets', from: app_relative_path("app/assets/stylesheets")
          serve '/assets/fonts',       from: app_relative_path('app/assets/fonts')
          serve '/images',             from: app_relative_path("app/assets/images")

          css :application, %w[
            /assets/stylesheets/application.css
          ]

          js :application, %w[
            /assets/scripts/application.js
          ]

          js :forms, %w[
            /theme/scripts/jquery/jquery.min.js
            /theme/scripts/jquery/jquery-migrate.min.js
            /theme/scripts/bootstrap/bootstrap.min.js
            /theme/scripts/theme.js
          ]

          css :theme, %w[
            /theme/stylesheets/bootstrap/bootstrap.css
            /theme/stylesheets/light-theme.css
            /theme/stylesheets/theme-colors.css
          ]

          js_compression  :jsmin    # :jsmin | :yui | :closure | :uglify
          css_compression :sass     # :simple | :sass | :yui | :sqwish
        }
      end
    end
  end
end
