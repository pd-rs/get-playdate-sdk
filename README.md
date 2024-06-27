# ![Playdate](https://help.play.date/images/toolbar-icon-playdate.svg) Get Playdate SDK

This GitHub Action delivers specified [Playdate SDK][Playdate].

Also installs arm-gcc gnu toolchain.

[Playdate]: https://play.date/dev/#cardSDK


## Parameters

- `version` - Specified version of the SDK. Optional. Default value is `latest`.
- `cache` - Cache installer. Default is `true`.
- `custom-url` - Custom URL to the SDK installer. Useful for beta versions. If set, `version` will be ignored.
- `gcc` - `true` to install `gcc-arm-none-eabi` toolchain, `false` to don't. Default is `true`.
  (Linux & Windows only. On macOS, the sdk installer installs the toolchain itself.)
- `root-win-path` - `true` to convert path to windows path format. _Only for win- workers._
  It changes `outputs.root`, but not `$PLAYDATE_SDK_PATH`.


## Supported platforms

- macOS
- Linux
- Windows


## Usage Example

```yaml
- name: Install Playdate SDK
  id: playdate
  uses: pd-rs/get-playdate-sdk@0.4
  with:
    version: 2.5.0 # possible values: version `x.x.x` or `latest` by default

- name: usage
  run: |
    echo "SDK path env: $PLAYDATE_SDK_PATH"
    echo "SDK root out: ${{ steps.playdate.outputs.root }}"
    echo "SDK version: ${{ steps.playdate.outputs.version }}"
    pdc --version # because SDK/bin already in PATH
```


### Windows and Powershell

Note that `$PLAYDATE_SDK_PATH` and `outputs.root` are set in POSIX format.
If you want to use it in powershell you should fix it using one of following solutions:
1. enable `root-win-path` _(see [inputs](#parameters))_
1. fix the env for powershell from bash with:
   ```yaml
   - if: runner.os == 'Windows'
    shell: bash
    run: |
      PLAYDATE_SDK_PATH=$(cygpath -w "$PLAYDATE_SDK_PATH")
      echo "PLAYDATE_SDK_PATH=$PLAYDATE_SDK_PATH" >> $GITHUB_ENV
   ```
   So you'll get fixed `$PLAYDATE_SDK_PATH` for powershell and normal `outputs.root` in POSIX
1. enable `root-win-path` _(see [inputs](#parameters))_ __and__ fix the env for powershell from bash with:
   ```yaml
   - name: Install Playdate SDK
     id: playdate
     uses: pd-rs/get-playdate-sdk@0.4
     with:
       root-win-path: true

   - run: echo "PLAYDATE_SDK_PATH=$PLAYDATE_SDK_PATH" >> $GITHUB_ENV
     env: PLAYDATE_SDK_PATH: ${{ steps.playdate.outputs.root }}
     if: runner.os == 'Windows'
     shell: bash

   ```
   So you'll get both paths fixed for powershell - `$PLAYDATE_SDK_PATH` and `outputs.root`.
