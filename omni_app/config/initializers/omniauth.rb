Rails.application.config.middleware.use OmniAuth::Builder do 
  provider :facebook, '', '', scope: 'user_birthday, user_friends', info_fields: 'id, email, friends', display: 'popup'
  provider :github,   '', ''
  provider :twitter, '', ''
end