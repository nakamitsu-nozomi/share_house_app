module HouseHelper
  def rent(rooms)

      array=[]
      rooms.each do |room|
      array<< room.rent 
      end 
      unless array.blank?
      min= array[0]
      array.length.times { |i|
      if min > array[i]
          min = array[i]
      end
      }
      max= array[0]
      array.length.times { |i|
      if max < array[i]
          max = array[i]
      end
      }
      if max == min
        "#{max}"
      else  
        "#{min} 〜#{max}"
      end
    else
      "--"
    end  
  end

end