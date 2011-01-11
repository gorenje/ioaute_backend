module PublicationsHelper
  # these classes are used by the print css to force page breaks after each page 
  # except the last page.
  def class_for_page_number(idx, total_pages)
    return "first_page" if idx == 0
    return "last_page" if idx == total_pages-1
    "not_first_or_last_page"
  end
end
