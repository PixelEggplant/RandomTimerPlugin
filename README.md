# RandomTimerPlugin
A simple and clean solution that adds a `RandomTimer` Node to the Godot engine, which can be used to run a `Timer` with random <b>Wait Time</b>s.

Built using Godot 4.2.1

_v 1.0.0 Readme_


### How to use this plugin

1. Place the 'addons' folder in your project's root folder. 
(If you've downloaded this from the Asset Library it should happen automatically)

2. In Project Settings, in the Plugins tab, set this plugin's `Status` to Enabled.

This should load the custom `RandomTimer` Node and it should be usable just like any other Node.


### Features

- Variance: A configurable field which sets the variance for the `RandomTimer`'s <b>Wait Time</b>.
    > <b>Variance</b>, in <b>seconds,</b>, applied to the base <Timer>.
    >
    > <b>Variance</b> creates the `min` and `max` values for the random <b>Wait Time</b> range.
    > 
    > `min` is calculated as `wait_time - variance`.
    > `min` is calculated as `wait_time + variance`.
    >
    > For example a <b>Wait Time</b> of <b>3</b> and a <b>Variance</b> of <b>1</b> would produce countdown times between <b>2</b> and <b>4</b>.
    >
    > <b>Note:</b> The <b>Wait Time</b> value calculated with <b>Variance</b> will never be set lower than `0.05`.

- Randomize on Timeout - A configurable field which determines whether the `RandomTimer` will have a different <b>Wait Time</b> after every time it finishes.
    > If `true`, a new <b>Wait Time</b> will be calculated every time the `Timer` times out.

- Randomize on Start - A configurable field which determines whether the `RandomTimer` will have a different <b>Wait Time</b> every time that `RandomTimer.start()` gets executed.
    > If `true`, a new <b>Wait Time</b> will be calculated every time the `RandomTimer.start()` is exectuted.


### Bugs / Feedback

- None

If you find any bugs or have some feedback about things you would like to see changed or added, make an issue on github:

https://github.com/PixelEggplant/RandomTimerPlugin/issues
