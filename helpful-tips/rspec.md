# Settings for rspec that are nice

# Can use the focus flag
config.filter_run_when_matching :focus
# Enables use of --only-failures
config.example_status_persistence_file_path = 'spec/examples.txt'
# Have to prefix all your methods with RSpec
config.disable_monkey_patching!

config.default_formatter = 'doc' if config.files_to_run.one?

config.profile_examples = 10

config.order = :random
Kernel.srand config.seed


