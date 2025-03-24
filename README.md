# mobileoperator plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-mobileoperator)

## 🚀 Getting Started
This project is a fastlane plugin. To get started with fastlane-plugin-mobileoperator, add it to your project by running:

```bash
fastlane add_plugin mobileoperator
```

Then, you can use it in your Fastfile like this:
```ruby
lane :upload_to_mobile_operator do
  gym(
    scheme: "benchmarkapp",        # Change this to your scheme
    export_method: "development"
  )

  upload_to_mobileoperator(
    file_path: lane_context[SharedValues::IPA_OUTPUT_PATH],
    api_key: "my-secret-api-key"
  )
end
```

This will build your app and upload the .ipa to your custom MobileOperator storage.


## About mobileoperator

Upload your ipa, apk or app to MobileOperator

**Note to author:** Add a more detailed description about this plugin here. If your plugin contains multiple actions, make sure to mention them here.

## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`.

**Note to author:** Please set up a sample project to make it easy for users to explore what your plugin does. Provide everything that is necessary to try out the plugin in this project (including a sample Xcode/Android project if necessary)

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
