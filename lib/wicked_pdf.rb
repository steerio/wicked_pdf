# wkhtml2pdf Ruby interface
# http://code.google.com/p/wkhtmltopdf/

require 'logger'
require 'digest/md5'
require 'open3'
require 'active_support/core_ext/class/attribute_accessors'

require 'wicked_pdf/tempfile'
require 'wicked_pdf/renderer'
require 'wicked_pdf/railtie' if defined?(Rails)
