module WickedPdf
  module Helper
    def wicked_pdf_stylesheet_link_tag *sources
      sources.collect { |source|
        "<style type='text/css'>#{Rails.application.assets.find_asset("#{source}.css").body}</style>"
      }.join("\n")
      .gsub(/url\(['"]?\/assets(?<img>.+)['"]?\)(?<opts>.+)/,%[url("#{wicked_pdf_asset_location("\\k<img>")}")\\k<opts>])
      .gsub(/url\(['"]?\/images(?<img>.+)['"]?\)(?<opts>.+)/,%[url("#{wicked_pdf_image_location("\\k<img>")}")\\k<opts>]).html_safe
    end

    def wicked_pdf_image_tag img, options={}
      image_tag wicked_pdf_image_location(img), options
    end

    def wicked_pdf_javascript_src_tag jsfile
      "<script type='text/javascript'>#{Rails.application.assets.find_asset("#{source}.js").body}</script>"
    end

    def wicked_pdf_javascript_include_tag *sources
      sources.collect{ |source| wicked_pdf_javascript_src_tag(source, {}) }.join("\n").html_safe
    end

    def wicked_pdf_asset_location img
      params ||= {}
      params[:debug].present? ? "/assets#{img}" : "file://#{Rails.root.join('app', 'assets', 'images')}#{img}"
    end
    def wicked_pdf_image_location img
      params ||= {}
      params[:debug].present? ? "/images#{img}" : "file://#{Rails.root.join('public', 'images')}#{img}"
    end

  end
end
