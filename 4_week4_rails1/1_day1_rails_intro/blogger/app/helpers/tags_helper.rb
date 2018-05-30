module TagsHelper
	def article_params
		params.require(:tag).permit(:name)
	end
end
