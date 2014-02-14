Rails.application.config.middleware.use OmniAuth::Builder do
	# The following is for facebook
	provider :facebook, '1415658171978878', 'd245a275e7f50cb4fa813bd9e69c2a59', {:scope => 'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access'}

	# If you want to also configure for additional login services, they would be configured here.
end