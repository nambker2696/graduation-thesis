# :nodoc:
module ApplicationHelper
  def title
    if content_for?(:title)
      # allows the title to be set in the view by using t(".title")
      content_for :title
    else
      # look up translation key based on controller path, action name and .title
      # this works identical to the built-in lazy lookup
      # t("#{ controller_path.tr('/', '.') }.#{ action_name }.title", default: :site_name)
      "SFood"
    end
  end
  def hidden_div_if(condition,attributes = {},&block)
    #attributes = {}  变量的默认值是空的哈希 
    if condition 
      attributes["style"] = "display: none"
    end
    content_tag("div",attributes,&block)
  end
end
  