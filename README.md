# Céu-Maker

Céu-Maker is a programming environment that integrates `ceu-arduino` and
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
    - Drag & Drop the same file `serial.ceu` into the icon `pico-Céu` (`bin/` folder) and then into the icon `Céu-Arduino` (`bin/` folder).
    - Observe the application behavior.

-------------------------------------------------------------------------------

## Package Generation (for developers only)

Céu-Maker depends on
    [Céu](https://github.com/fsantanna/ceu),
    [Céu-Arduino](https://github.com/fsantanna/ceu-arduino),
    [Céu-SDL](https://github.com/fsantanna/ceu-sdl), and
    [pico-Céu](https://github.com/fsantanna/pico-ceu).

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

- To generate a self-extracting executable, run in Windows Command Prompt the following line of code:
```
"WinRAR/WinRAR64/WinRAR.exe" a -zWinRAR/setup_comment.txt -r -sfx -iiconceu-maker/cib_192.ico ceu-maker.exe "ceu-maker/*"
```

Note that we use [WinRAR](https://www.win-rar.com) to generate a self-extracting executable. The above command only works for 64-bit machines. If the machine used is 32-bit, download the corresponding WinRAR version and modify the command to use the new WinRAR executable.

- Move `ceu-maker.exe` to `releases/ceu-maker-vX.XX-XXX.exe`
- Add release to GitHub:
    - https://github.com/fsantanna/ceu-maker/releases/new
