# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_logistic_session',
  :secret      => '4688cc409fe1fc803cd48eb33505475449b01ffa368d7dd1f8867ada6f6119109c49a1c1b95b9067f492a68cd6a4ff6c2e6a0919513b1a6688226d29e405bf5e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
