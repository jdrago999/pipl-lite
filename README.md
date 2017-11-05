
# pipl-lite

Search Pipl API, the simple way.

https://www.pipl.com/

## Usage

In your Gemfile:

```ruby
gem 'pipl-lite'
```

In your code:

```ruby
Pipl.configure(key: ENV.fetch('PIPL_KEY'))
result = Pipl.search(
  raw_name: 'Clark Kent',
  country: 'US',
  state: 'KS',
  city: 'Smallville'
)
```

# License: Apache


