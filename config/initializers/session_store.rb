# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_references_session',
  :secret      => '2658fd2b2048536a43730f49fdc5f9b5e6654b75b4bf5e350c54ff1ec7733695fdac15aeed2e78eb6da67b924188be71257dc29ab57b0af61cb7efa1706cb045'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
