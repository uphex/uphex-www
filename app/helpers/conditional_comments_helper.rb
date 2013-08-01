module ConditionalCommentsHelper
  extend Padrino::Helpers::FormatHelpers
  extend Padrino::Helpers::OutputHelpers

  def cc_html(options = {}, &block) 
    attrs = options.map { |(k, v)| " #{h! k}='#{h! v}'" }.join('')
    [ "<!--[if lt IE 7]> <html#{attrs} class='lt-ie9 lt-ie8 lt-ie7'> <![endif]-->",
      "<!--[if IE 7]>    <html#{attrs} class='lt-ie9 lt-ie8'> <![endif]-->",
      "<!--[if IE 8]>    <html#{attrs} class='lt-ie9'> <![endif]-->",
      "<!--[if gt IE 8]><!--> <html#{attrs} class=''> <!--<![endif]-->",
      capture(&block).strip,
      "</html>"
    ].join("\n")
  end
end
