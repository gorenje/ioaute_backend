module StringExtensions
  def remove_indent
    self =~ /\A([ \t]+)/ ? gsub(/\n#{$1}/, "\n").strip : self
  end
  
  def nbsp_leading_whitespace
    self.gsub(/(\n[ \t]+)/) { |whitespace| whitespace.gsub(/[ \t]/, '&nbsp;') }
  end
  
  def convert_urls_to_links(html_option_string = "")
    self.gsub(/((https?|ftps?):\/\/[^[:space:]]+)/, 
              "<a #{html_option_string} href='\\1'>\\1</a>")
  end
end
String.send(:include, StringExtensions)
