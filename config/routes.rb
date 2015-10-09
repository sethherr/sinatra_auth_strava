module Example
  class App < Sinatra::Base
    set root: File.expand_path('../../', __FILE__)
    configure do
      register Sinatra::AssetPipeline
      set :assets_css_compressor, :sass
      set :assets_js_compressor, :uglifier
      if defined?(RailsAssets)
        RailsAssets.load_paths.each do |path|
          settings.sprockets.append_path(path)
        end
      end
    end
    # Write your routes below here

    get '/' do
      haml :demo_index
    end
  end
end
