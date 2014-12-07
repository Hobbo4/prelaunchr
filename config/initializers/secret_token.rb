# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Prelaunchr::Application.config.secret_token = ENV["RAILS_SECRET"] || '2f0dd1061116b6ebee9bcabb9bdb023374675c42595869ac6e1f5cf08784ce88af6b25266e7799e2461ccf87e8d8957e4b9deec8b606741aa9cbc3b0fb6bf894'