# trouble after kernel update

```sh
sudo akmods --force --rebuild
```

or 

```sh
sudo akmods --force --kernel "$(uname -r)"
```

then

```sh
sudo dracut --force
```