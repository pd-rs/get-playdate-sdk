# Get Playdate SDK

This GitHub Action delivers specified [Playdate] SDK.

[Playdate]: https://play.date/dev/#cardSDK


## Parameters

- `version` - Specified version of the SDK. Optional. Default value is `latest`.
<!-- - `token` - GITHUB_TOKEN. Optional. -->

## Usage Example

Download the latest version of dove

```yaml
- name: Install Playdate SDK
  id: playdate
  uses: pd-rs/get-playdate-sdk@0.1.4
  with:
    # possible values: version x.x.x or "latest"
    version: latest

- name: usage
  run: |
    echo "SDK root: $PLAYDATE_SDK_PATH"
    echo "SDK root: ${{ steps.playdate.outputs.root }}"
    echo "SDK version: ${{ steps.playdate.outputs.version }}"
    pdc --version
```
