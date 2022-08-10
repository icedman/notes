# pyenv #

# virtualenv #

```sh
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
```

# .zshrc #

```sh
###########################
# Python
###########################
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

# pipx #

for globally installed tools

```sh
pip global 3.10.5
pip install pipx
pipx ensurepath
```

# linting #

```sh
pip install mypy
```

# formatting #

```sh
pipx install black
```

# other useful modules

httpserver

# pyenv usage

https://raw.githubusercontent.com/pyenv/pyenv-virtualenv/master/README.md

## Usage

### Using `pyenv virtualenv` with pyenv

To create a virtualenv for the Python version used with pyenv, run
`pyenv virtualenv`, specifying the Python version you want and the name
of the virtualenv directory. For example,

```sh
$ pyenv virtualenv 2.7.10 my-virtual-env-2.7.10
```

will create a virtualenv based on Python 2.7.10 under `$(pyenv root)/versions` in a
folder called `my-virtual-env-2.7.10`.


### Create virtualenv from current version

If there is only one argument given to `pyenv virtualenv`, the virtualenv will
be created with the given name based on the current pyenv Python version.

```sh
$ pyenv version
3.4.3 (set by /home/yyuu/.pyenv/version)
$ pyenv virtualenv venv34
```


### List existing virtualenvs

`pyenv virtualenvs` shows you the list of existing virtualenvs and `conda` environments.

```sh
$ pyenv shell venv34
$ pyenv virtualenvs
  miniconda3-3.9.1 (created from /home/yyuu/.pyenv/versions/miniconda3-3.9.1)
  miniconda3-3.9.1/envs/myenv (created from /home/yyuu/.pyenv/versions/miniconda3-3.9.1)
  2.7.10/envs/my-virtual-env-2.7.10 (created from /home/yyuu/.pyenv/versions/2.7.10)
  3.4.3/envs/venv34 (created from /home/yyuu/.pyenv/versions/3.4.3)
  my-virtual-env-2.7.10 (created from /home/yyuu/.pyenv/versions/2.7.10)
* venv34 (created from /home/yyuu/.pyenv/versions/3.4.3)
```

There are two entries for each virtualenv, and the shorter one is just a symlink.


### Activate virtualenv

Some external tools (e.g. [jedi](https://github.com/davidhalter/jedi)) might
require you to `activate` the virtualenv and `conda` environments.

If `eval "$(pyenv virtualenv-init -)"` is configured in your shell, `pyenv-virtualenv` will automatically activate/deactivate virtualenvs on entering/leaving directories which contain a `.python-version` file that contains the name of a valid virtual environment as shown in the output of `pyenv virtualenvs` (e.g., `venv34` or `3.4.3/envs/venv34` in example above) . `.python-version` files are used by pyenv to denote local Python versions and can be created and deleted with the [`pyenv local`](https://github.com/pyenv/pyenv/blob/master/COMMANDS.md#pyenv-local) command.

You can also activate and deactivate a pyenv virtualenv manually:

```sh
pyenv activate <name>
pyenv deactivate
```


### Delete existing virtualenv

Removing the directories in `$(pyenv root)/versions` and `$(pyenv root)/versions/{version}/envs` will delete the virtualenv, or you can run:

```sh
pyenv uninstall my-virtual-env
```

You can also delete existing virtualenvs by using `virtualenv-delete` command, e.g. you can run:
```sh
pyenv virtualenv-delete my-virtual-env
```
This will delete virtualenv called `my-virtual-env`.
