RSpec.configure do |config|
    config.fail_fast = true
    config.color = true

    # Modified to deactivate warnings about :should syntax
    config.expect_with :rspec do |c|
        
        # Let´s use two syntaxs inside our tests
        c.syntax = [:should, :expect]
    end
end