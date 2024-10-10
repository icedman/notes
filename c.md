meson.build

```sh
if get_option('b_sanitize') == 'address'
    add_project_arguments('-fsanitize=address', language: 'c')
    add_project_link_arguments('-fsanitize=address', language: 'c')
endif
```

```sh
$ meson build_sanitize -Db_sanitize=address
```