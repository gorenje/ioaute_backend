module StringExtensions
  def remove_indent
    self =~ /\A([ \t]+)/ ? gsub(/\n#{$1}/, "\n").strip : self
  end
end
String.send(:include, StringExtensions)
