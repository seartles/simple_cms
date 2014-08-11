class Subject < ActiveRecord::Base

  scope :visible, lambda {where(:visible=> true)}
  scope :invisible, lambda {where(:visible=> false)}
  scope :sorted, lambda {order("subjects.position ASC")}
  scope :newest_first, lambda {order ("subjects.created_at DESC")}
  scope :search_by_name_substring, lambda{|attrib_v|
    where(["name LIKE ?", "%#{attrib_v}%"])
  }
end
