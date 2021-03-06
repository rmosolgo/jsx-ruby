# JSX [![Build Status](https://travis-ci.org/rmosolgo/jsx-ruby.svg?branch=master)](https://travis-ci.org/rmosolgo/jsx-ruby) [![Gem Version](https://badge.fury.io/rb/jsx.svg)](http://badge.fury.io/rb/jsx)

A Ruby interface to Facebook's JSX transformer, broken out of `react-rails`. You can:

- convert JSX willy-nilly
- Use `JSX::Template` with a Tilt environment (for example, Sinatra)

## Installation

```ruby
gem "jsx"
```

```
bundle install
```

## Ad Hoc Transform

You can access the transformer directly. Pass it some JavaScript with JSX. Optionally, pass `strip_types` or `harmony`. For example:

```ruby
compiled = JSX.transform("<h1>Hello {name}</h1>", strip_types: true, harmony: true)
# 'React.createElement("h1", {className: "greeting"}, "Hello ", name)'
```

## With Tilt

Tilt can automatically convert `.jsx` files. After loading Tilt and JSX, require `jsx/tilt`. For example:

```ruby
require 'tilt'
require 'jsx'
require 'jsx/tilt'
```

To use `harmony` or `strip_types` in this case, assign them to `JSX::Template.transform_options`. For example:

```ruby
JSX::Template.transform_options = {strip_types: true}
```

Now, the template will strip types from JSX code.

## License

- Facebook's JSX Transformer (part of React): [BSD](https://github.com/facebook/react/blob/master/LICENSE)
- This Ruby code: MIT