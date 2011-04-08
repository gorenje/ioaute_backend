Factory.define( :publication ) do |pub|
  pub.name "Fubar"
end

Factory.define( :user ) do |user|
end

Factory.define( :page_element ) do |pe|
  pe.x       123
  pe.y       321
  pe.z_index 2
  pe.width   1024
  pe.height  2048
  pe.page_id 1
  pe.id_str  "12345"
  pe.data    '{ "fubar" : "snafu" }'
end
