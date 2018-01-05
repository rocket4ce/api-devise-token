json.array! @posts.each do |p|
	json.id p.id 
	json.title capitalizar(p.title)
	json.body p.body
end