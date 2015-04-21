module PostsHelper
	def all_posts?
		( params[:controller] == 'posts' ) && ( params[:action] == 'all' )
	end
end
