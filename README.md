# 🖥🏗 MacOS setup
Scripts for setting up a brand new MacOS, and getting it ready to work in no time

## Installation
1. Download this repo: `$ git clone git@github.com:vol24pl/MacOS-setup.git`
2. Add permissions to execute the script: `$ chmod +x ./macbook-initial-setup.sh`
3. **Edit this script to your own liking**: `$ nano ./macbook-initial-setup.sh` 
4. Run the script: `$ ./macbook-initial-setup.sh`

## Additional (optional) steps after the install

- [ ] Edit template `ssh-config-file-example.txt` and copy it to `~/.ssh/config`

- [ ] Add [GoldenChaos-BTT](https://community.folivora.ai/t/goldenchaos-btt-a-complete-touch-bar-ui-replacement-preset/1281) for BetterTouchTool


- [ ] Setup UEFI firmware password and set booting to the strickest setting (only Apple-Signed code)

- [ ] Change monotype font everywhere to: `SF Mono 12`

- [ ] For GPG signing in SourceTree, make sure it's using `/usr/local/Cellar/gnupg/<VERSION-NUMBER>/bin/` as a GPG Program path (and that you made symbolic link from the setup script):
![SourceTree fix](./images/sourcetree-fix.png)

