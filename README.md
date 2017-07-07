[![Koara](http://www.codeaddslife.com/koara.png)](http://www.codeaddslife.com/koara)

[![Build Status](https://img.shields.io/travis/koara/koara-rb-html.svg)](https://travis-ci.org/koara/koara-rb-html)
[![Coverage Status](https://img.shields.io/coveralls/koara/koara-rb-html.svg)](https://coveralls.io/github/koara/koara-rb-html?branch=master)
[![Gem](https://img.shields.io/gem/v/koara-html.svg?maxAge=2592000)](https://rubygems.org/gems/koara-html)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://github.com/koara/koara-rb-html/blob/master/LICENSE)

# Koara-rb-html
[Koara](http://www.codeaddslife.com/koara) is a modular lightweight markup language. This project can render the koara AST to Html in Ruby.
The AST is created by the [core koara parser](https://github.com/koara/koara-rb).

## Getting started

```bash
gem install koara-html
```

## Usage

```ruby
require 'koara'
require 'koara/html'

parser = Koara::Parser.new
result = parser.parse('Hello World!')
renderer = Koara::Html::Html5Renderer.new
result.accept(renderer)
puts renderer.output
```
  


## Configuration
You can configure the Renderer:

-  **renderer.partial**  
   Default:	`true`
   
   When false, the output will be wrapped with a `<html>` and `<body>` tag to make a complete Html document.