# Bundler 2.4.8/2.4.9 platform issue demonstration

This repo demonstrates an issue/regression with Bundler 2.4.8 and 2.4.9 which I believe is a regression of [rubygems#5830](https://github.com/rubygems/rubygems/issues/5830).

Essentially what seems to be happening is that when `ruby` is a listed platform in the `Gemfile.lock` and you add a gem to the `Gemfile` and run `bundle`, the PLATFORMS is being changed from `ruby` to that on which `bundle` was run. This does not happen with Bundler 2.4.7 but does with Bundler 2.4.8 and 2.4.9.

### Requirements

* Docker
* make

### Running

```
make
```

### Output

```
% make
Bundler 2.4.7 test...
Doing initial bundle...
PLATFORMS
  ruby

Doing second bundle after adding gem...
PLATFORMS
  ruby

--------------------------------------------------------------------------
Bundler 2.4.8 test...
Doing initial bundle...
PLATFORMS
  ruby

Doing second bundle after adding gem...
PLATFORMS
  aarch64-linux

--------------------------------------------------------------------------
Bundler 2.4.9 test...
Doing initial bundle...
PLATFORMS
  ruby

Doing second bundle after adding gem...
PLATFORMS
  aarch64-linux
```
