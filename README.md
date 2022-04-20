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
  uses: ./
  with:
    # optional, can be omitted
    # possible values: version (1.10.0 or 1.9.3) or "latest"
    version: latest

- name: usage
  run: |
    echo "SDK root: $PLAYDATE_SDK_PATH"
    echo "SDK root: ${{ steps.playdate.outputs.root }}"
    echo "SDK version: ${{ steps.playdate.outputs.version }}"
    pdc --version
```
