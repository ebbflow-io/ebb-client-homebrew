# homebrew-ebbflow
Homebrew tap for the [ebbflow](https://ebbflow.io) client, see

https://github.com/ebbflow-io/ebbflow

## Instructions to release

```
shasum -a 256 ~/Downloads/ebbflow_1.1.0_macos.zip
```

- On new version, update the following:
  - `url`
  - `sha256`
  - `version`
- Test Locally
  - `brew upgrade -v ./Formula/ebbflow.rb`
  - Test..
