# salt-home-env
A saltstack formula for user's home environment configuration.
Creates a user and uploads personal confgs for vim, tmux, git.
Creates sudo config for the user.

## use cases

Run formula locally
```
cp pillar/base.sls pillar/alex.sls
vim pillar/alex.sls
salt-call --local state.apply init pillarenv=alex
```

or start a master, a minion and run salt command
```
salt-minion &
salt-master &
salt-key -ya noname
salt noname state.apply init pillarenv=alex
```

or via ssh
```
cp roster.example roster
vim roster
salt-ssh targethost state.apply init pillarenv=alex
```

For latter method with salt-ssh a workaround is needed. Add `master.d/hz.conf`:
```
pillar_roots:
  alex:
    - /home/alex/Dev/salt-home-env/pillar
```
