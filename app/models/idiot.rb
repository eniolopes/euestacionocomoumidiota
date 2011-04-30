class Idiot < ActiveRecord::Base

  has_attached_file :photo,
                    :styles => {:medium => "300x300", :thumb => "100x100"}
  
  validates_presence_of :description , :location, :photo
  validates_attachment_content_type :photo, 
                                    :message => "Please upload correct format", 
                                    :content_type => ['image/jpeg','image/jpg']

  
end
