require 'wicked_pdf/pdf_helper'
require 'wicked_pdf/helper'

module WickedPdf
  class Railtie < Rails::Railtie
    initializer "wicked_pdf.register" do |app|
      ActionController::Base.send :include, PdfHelper
      ActionView::Base.send :include, Helper
      Mime::Type.register('application/pdf', :pdf) unless Mime::Type.lookup_by_extension(:pdf)
    end
  end
end
