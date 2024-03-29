# ![Playdate](https://help.play.date/images/toolbar-icon-playdate.svg) Get Playdate SDK

This GitHub Action delivers specified [Playdate SDK][Playdate].

Also installs arm-gcc gnu toolchain.

[Playdate]: https://play.date/dev/#cardSDK


## Parameters

- `version` - Specified version of the SDK. Optional. Default value is `latest`.
- `cache` - Cache installer. Default by `true`.
- `custom-url` - Custom URL to the SDK installer. Useful for beta versions. If set, `version` will be ignored.


## Usage Example

```yaml
- name: Install Playdate SDK
  id: playdate
  uses: pd-rs/get-playdate-sdk@0.1.6
  with:
    version: 2.0.0 # possible values: version `x.x.x` or `latest` by default

- name: usage
  run: |
    echo "SDK path env: $PLAYDATE_SDK_PATH"
    echo "SDK root out: ${{ steps.playdate.outputs.root }}"
    echo "SDK version: ${{ steps.playdate.outputs.version }}"
    pdc --version # because SDK/bin already in PATH
```

## Supported platforms

- macOS
- Linux
- Windows
