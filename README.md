# Bundler 2.4.8/2.4.9 platform issue demonstration

This repo demonstrates an issue/regression with Bundler 2.4.8 and 2.4.9 which I believe is a regression of [rubygems#5830](https://github.com/rubygems/rubygems/issues/5830).

Essentially what seems to be happening is that when `ruby` is a listed platform in the `Gemfile.lock` and you add a gem to the `Gemfile` and run `bundle`, the PLATFORMS is being changed from `ruby` to that on which `bundle` was run. This does not happen with Bundler 2.4.7 but does with Bundler 2.4.8 and 2.4.9.

### Requirements

* Docker

### Running

```
./run.sh
```

(To force a particular platform, uncomment the appropriate `PLATFORM_ARG="..."` line inside `run.sh`. I'm on an ARM platform, but the same issue occurs when I force x86_64.)

### Output

```
% ./run.sh
===============================================================

Building Docker image for Rubygems 3.4.7...
Doing initial bundle...
PLATFORMS
  ruby

Doing second bundle after adding gem...
PLATFORMS
  ruby

===============================================================

Building Docker image for Rubygems 3.4.8...
Doing initial bundle...
PLATFORMS
  ruby

Doing second bundle after adding gem...
PLATFORMS
  aarch64-linux

===============================================================

Building Docker image for Rubygems 3.4.9...
Doing initial bundle...
PLATFORMS
  ruby

Doing second bundle after adding gem...
PLATFORMS
  aarch64-linux

```

And forcing x86_64:

```
% ./run.sh
===============================================================

Building Docker image for Rubygems 3.4.7...
Doing initial bundle...
PLATFORMS
  ruby

Doing second bundle after adding gem...
PLATFORMS
  ruby

===============================================================

Building Docker image for Rubygems 3.4.8...
Doing initial bundle...
PLATFORMS
  ruby

Doing second bundle after adding gem...
PLATFORMS
  x86_64-linux

===============================================================

Building Docker image for Rubygems 3.4.9...
Doing initial bundle...
PLATFORMS
  ruby

Doing second bundle after adding gem...
PLATFORMS
  x86_64-linux
```
