module UserHelper
  def MypageAdminLink(path,item,title)
    if current_page?(path)
      link_to "#{title} #{ item.count}件", path,class:"btn btn-dark col-3" 
    else 
      link_to "#{title}#{ item.count}件", path,class:"btn btn-outline-dark col-3" 
    end
  end 
  def MypageLink(path,item,title)
    if current_page?(path)
      link_to "#{title} #{ item.count}件", path,class:"btn btn-dark col-4" 
    else 
      link_to "#{title}#{ item.count}件", path,class:"btn btn-outline-dark col-4" 
    end 
  end
end