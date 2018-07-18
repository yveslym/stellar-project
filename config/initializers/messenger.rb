# YOUR_APP/config/initializers/messenger.rb
Messenger.configure do |config|

  config.verify_token      = 'yves' #will be used in webhook verifiction
  config.page_access_token='EAAC4NJBme3wBAFj7rVSpp7wGJoEbW4oOMstE7aCEGNHLwxgETyIozLHCQlpRary1uPXFMg5JaewM7NlJzd0rOtxm0l1siR8gZAEg6rDin8ANrEZC456yuRJ5fdDENX1tcL1b9iGQ7VBeln21tWTIqzGt6CfQl1AlyTTaaiGeRjwhn73zeU'

print(config.verify_token)

end
