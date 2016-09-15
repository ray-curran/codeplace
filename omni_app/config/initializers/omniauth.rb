Rails.application.config.middleware.use OmniAuth::Builder do 
  provider :facebook, '1808727469369334', 'd9624a1feae39a29e701589a7a31b61f', scope: 'user_birthday, user_friends', info_fields: 'id, email, friends', display: 'popup'
end