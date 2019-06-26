# SampleScenicInky

A sample application for using the Scenic Driver for the Inky eInk display. It uses the Elixir-library Inky and a custom driver heavily based off of the the nerves-training oled bonnet driver.

Scenic is the easiest way to render text and basic primitives to the display that we've tried so far.

## Getting it running on the host

You have to run this with no-halt in dev or it will just blink past and close down.

```
mix deps.get
mix run --no-halt
```

## Getting it onto hardware

To start your Nerves app:
  * `export MIX_TARGET=my_target` or prefix every command with
    `MIX_TARGET=my_target`. For example, `MIX_TARGET=rpi0`
  * Install dependencies with `mix deps.get`
  * Create firmware with `mix firmware`
  * Burn to an SD card with `mix firmware.burn`
  * Any subsequent updates can use `mix firmware.gen.script` and `./upload.sh`

## Learn more

  * Official docs: https://hexdocs.pm/nerves/getting-started.html
  * Official website: https://nerves-project.org/
  * Forum: https://elixirforum.com/c/nerves-forum
  * Discussion Slack elixir-lang #nerves ([Invite](https://elixir-slackin.herokuapp.com/))
  * Source: https://github.com/nerves-project/nerves
