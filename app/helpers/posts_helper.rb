module PostsHelper
	def all_posts?
		( params[:controller] == 'posts' ) && ( params[:action] == 'all' )
	end
	def single_post?
		( params[:controller] == 'posts' ) && ( params[:action] == 'show' )
	end
end
