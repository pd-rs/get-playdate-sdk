# ![Playdate](https://help.play.date/images/toolbar-icon-playdate.svg) Get Playdate SDK

This GitHub Action delivers specified [Playdate SDK][Playdate].

[Playdate]: https://play.date/dev/#cardSDK


## Parameters

- `version` - Specified version of the SDK. Optional. Default value is `latest`.
<!-- - `token` - GITHUB_TOKEN. Optional. -->

## Usage Example

Install the latest version of Playdate SDK

```yaml
- name: Install Playdate SDK
  id: playdate
  uses: pd-rs/get-playdate-sdk@0.1.6
  with:
    version: 2.0.0 # possible values: version `x.x.x` or `latest`

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

Note: for Windows there's [winget][] is used as source for specified SDK version, and as just installer-helper for `latest` version

[winget]: https://github.com/idleberg/winget-pkgs/tree/master/manifests/p/Panic/PlaydateSDK
