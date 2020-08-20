# Boxybox

Need to create boxes in boxes in boxes in boxes?  Great news! You've found a gem that does just that.  This is a dive into the world of command line apps using TTY focusing on the tty-box and supporting gems.  This has been done in a way to extend out the customization of each box quite easily by adding additional root properties to the boxes.  For the purpose of this exercise I've chosen to stick with just the examples given in the challenge as well as the ability to craft new box nesting patterns by supplying custom JSON configs.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'boxybox'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install boxybox

## Usage

To print one of the 4 provided examples along with the config json used to construct the boxes use the following command
```shell script
$ boxybox boxes -e example1 -p
```
This is helpful when wanting to understand the config syntax with clear examples.

```shell script
$ boxybox boxes -f ~/some_config.json
```

Use the above command if you wish to pass in a custom JSON config.

#### Configuration

The following example shows how boxes can be configured using JSON.  There is a top level `boxes` object which represents our outer or parent box.
Each box may have children boxes in a horizontal or vertical pattern which is designated by the `direction` property.  `children` are given as an array with content boxes using the `content` propery.  The examples given follow the examples given in the project requirements, however content can be populated with text and all boxes will scale properly.

While this may be a bit overkill, using JSON in this way allows for more complicated structures in the future.  As this gem utilizes the `tty` toolset, specifically the `tty-box` gem, many properties may be passed through and included in the future with relative ease.

```json
{
  "boxes": {
    "direction": "vertical",
    "children": [
      {
        "direction": "horizontal",
        "children": [
          {
            "direction": "vertical",
            "children": [
              {
                "content": " "
              },
              {
                "content": " "
              }
            ]
          },
          {
            "content": " "
          },
          {
            "content": " "
          }
        ]
      },
      {
        "content": " "
      },
      {
        "content": " "
      },
      {
        "direction": "horizontal",
        "children": [
          {
            "content": " "
          },
          {
            "content": " "
          }
        ]
      }
    ]
  }
}
```

The above config will print out the following:

```text
+-------------------------+
|                         |
| +---------------------+ |
| |                     | |
| | +-------++---++---+ | |
| | |       ||   ||   | | |
| | | +---+ ||   ||   | | |
| | | |   | ||   ||   | | |
| | | |   | |+---++---+ | |
| | | |   | |           | |
| | | +---+ |           | |
| | | +---+ |           | |
| | | |   | |           | |
| | | |   | |           | |
| | | |   | |           | |
| | | +---+ |           | |
| | |       |           | |
| | |       |           | |
| | +-------+           | |
| |                     | |
| +---------------------+ |
| +---+                   |
| |   |                   |
| |   |                   |
| |   |                   |
| +---+                   |
| +---+                   |
| |   |                   |
| |   |                   |
| |   |                   |
| +---+                   |
| +------------+          |
| |            |          |
| | +---++---+ |          |
| | |   ||   | |          |
| | |   ||   | |          |
| | |   ||   | |          |
| | +---++---+ |          |
| |            |          |
| +------------+          |
|                         |
|                         |
|                         |
|                         |
+-------------------------+
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/boxybox. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Boxybox project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/boxybox/blob/master/CODE_OF_CONDUCT.md).

## Copyright

Copyright (c) 2020 Travis Carter. See [MIT License](LICENSE.txt) for further details.
