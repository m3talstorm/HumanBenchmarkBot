# [HumanBenchmark Bot](https://github.com/m3talstorm/HumanBenchmarkBot/)

A bot written in AutoHotKey to run the reaction test at [www.humanbenchmark.com](http://www.humanbenchmark.com/).

## How To:

* [Download the latest release](https://github.com/twbs/bootstrap/archive/v3.3.5.zip) or clone the repo: `https://github.com/m3talstorm/HumanBenchmarkBot.git`.
* Download and install [AutoHotKey](http://ahkscript.org/download/ahk-install.exe)
* Run the `HumanBenchmarkBot.ahk` file (Windows: right click - run as administrator)
* Navigate to the [HumanBenchmark website](http://www.humanbenchmark.com/tests/reactiontime)
* Move the mouse over the blue header bar of the webpage and use `Ctrl + Left mouse click` to start the bot, then `Left mouse click` to start the test. When the Bot detects the header bar changes green it will automatically `Left mouse click` to simulate the user. It will repeat this a futher 4 times to complete the standard test.
* The test run can be aborted by pressing `Ctrl + Left mouse click` again or the bot can be killed by pressing Escape.


## Additional Notes:
* There are more ease-of-use keybinding described at the top of the `HumanBenchmarkBot.ahk` file.
* `Ctrl + Right mouse click` can be used to get the colour under the mouse pointer, to update the bot if the page colour changes.
* More tests can be run by either repeating the above process or modifying the `Max` variable within the `HumanBenchmarkBot.ahk` file.
* My mid-range PC averages around 50ms.
