# Céu-Maker

Céu-Maker is a programming environment that integrates `ceu-arduino` and
`pico-ceu` in a single package for Windows.

## Installation

- Download the latest release from GitHub:
    - https://github.com/ceu-lang/ceu-maker/releases
- Execute the downloaded file and choose the appropriate destination.
- After the installation, two windows will appear:
    - The folder `bin/`.
    - The folder `examples/`.

### Testing

- pico-Céu
    - Open the folder `examples/pico-ceu/`.
    - Drag & Drop the file `all.ceu` into the icon `pico-Céu` (`bin/` folder).
    - Observe the application behavior.
- Céu-Arduino
    - Plug the Arduino board you want to test.
    - Execute `ceu-maker/arduino-1.8.3/arduino.exe` and configure `Tools->Board` and `Tools->Port`.
    - Open the folder `examples/ceu-arduino/`.
    - Drag & Drop the file `blink-01.ceu` into the icon `Céu-Arduino` (`bin/` folder).
    - Observe the application behavior.
- Both
    - Open the folder `examples/both/`.
    - Drag & Drop the same file `serial.ceu` into the icon `pico-Céu` (`bin/` folder) and then into the icon `Céu-Arduino` (`bin/` folder).
    - Observe the application behavior.

-------------------------------------------------------------------------------

## Package Generation (for developers only, windows only)

Céu-Maker depends on
    [Céu](https://github.com/ceu-lang/ceu),
    [Céu-Arduino](https://github.com/ceu-lang/ceu-arduino),
    [Céu-SDL](https://github.com/ceu-lang/ceu-sdl), and
    [pico-Céu](https://github.com/ceu-lang/pico-ceu).

Open *Git Bash*, clone this repository, and run `make`:

```
$ git clone https://github.com/ceu-lang/ceu-maker/
$ cd ceu-maker/
$ ceu-maker/mingw/bin/make.exe
```

This will download all dependencies and generate a self-extracting package
`releases/ceu-maker.exe` with the Céu-Maker.

To release a new version, rename the file and add it to *GitHub*:

- Rename `releases/ceu-maker.exe` to `releases/ceu-maker-vX.XX-XXX.exe`
- Add release to GitHub:
    - https://github.com/ceu-lang/ceu-maker/releases/new
