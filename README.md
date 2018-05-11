# C�u-Maker

C�u-Maker is a programming environment that integrates `ceu-arduino` and
`pico-ceu` in a single package for Windows.

## Installation

- Download the latest release from GitHub:
    - https://github.com/fsantanna/ceu-maker/releases
- Execute the downloaded file and choose the appropriate destination.
- After the installation, two windows will appear:
    - The folder `bin/`.
    - The folder `samples/`.

### Testing

- pico-C�u
    - Open the folder `samples/pico-ceu/`.
    - Drag & Drop the file `all.ceu` into the icon `pico-C�u` (`bin/` folder).
    - Observe the application behavior.
- C�u-Arduino
    - Plug the Arduino board you want to test.
    - Execute `ceu-maker/arduino-1.8.3/arduino.exe` and configure `Tools->Board` and `Tools->Port`.
    - Open the folder `samples/ceu-arduino/`.
    - Drag & Drop the file `blink-01.ceu` into the icon `C�u-Arduino` (`bin/` folder).
    - Observe the application behavior.
- Both
    - Open the folder `samples/both/`.
    - Drag & Drop the same file `serial.ceu` into the icon `pico-C�u` (`bin/` folder) and then into the icon `C�u-Arduino` (`bin/` folder).
    - Observe the application behavior.

-------------------------------------------------------------------------------

## Package Generation (for developers only)

C�u-Maker depends on
    [C�u](https://github.com/fsantanna/ceu),
    [C�u-Arduino](https://github.com/fsantanna/ceu-arduino),
    [C�u-SDL](https://github.com/fsantanna/ceu-sdl), and
    [pico-C�u](https://github.com/fsantanna/pico-ceu).

To generate a new version of C�u-Maker, use the instructions as follows.

### Collect all relevant files to C�u-Maker

Clone the source repositories:

```
$ git clone https://github.com/fsantanna/ceu
$ git clone https://github.com/fsantanna/ceu-arduino
$ git clone https://github.com/fsantanna/ceu-sdl
$ git clone https://github.com/fsantanna/pico-ceu
```

Checkout the target version for each of the source repositories, except the Céu one (use the HEAD commit), e.g.:

```
$ cd ceu/
$ git checkout v0.30
```

This step can be skipped if you want to use the `master` branches.

Edit `Makefile.dirs` to point to the source repositories:

```
$ vi Makefile.dirs
```

Run `make` using Git Bash to copy the files from the source repositories to `ceu-maker/`:

```
$ ceu-maker/mingw/bin/make.exe
```

### Testing

Follow the `Installation->Testing` instructions above.

### Generate Package

We use WinRAR to generate a self-extracting executable:

https://www.win-rar.com

- Open the Windows Explorer.
- Right click on the subdirectory `ceu-maker/` (inside the `ceu-maker` repository).
    - Click on `Add to archive...`.
- Check the option `Create SFX archive`.
- Click on the tab `Advanced`.
    - Click on the button `SFX options...`.
        - Click on the tab `Setup`.
            - Write in the text area `Run after extraction`:
                - `ceu-maker\start.bat`
        - Click on the tab `Advanced`.
            - Click on the button `Add shortcut...`.
                - Write in the text area `Source file name`.
                    - `ceu-maker\bin\`
                - Write in the text area `Shortcut name`.
                    - `C�u-Maker`
                - Write in the text area `Shortcut icon`.
                    - `ceu-maker\cib_192.ico`
                - Click on the button `OK`.
        - Click on the tab `Text and icon`.
            - Click on the button `Browse` in `Load SFX icon from the file`
                - Choose path `icos/cib_192.ico`.
        - Click on the button `OK`.
- Click on the button `OK`.
- Move `ceu-maker.exe` to `releases/ceu-maker-vX.XX-XXX.exe`
- Add release to GitHub:
    - https://github.com/fsantanna/ceu-maker/releases/new
