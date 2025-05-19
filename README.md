# dashtoo


dashtoo: gentoo ebuilds

# repository

  - sudo eselect repository add dashtoo git https://github.com/dashingdon/dashtoo.git

# syntax

  - `sudo ebuild /path/to/ebuild digest fetch unpack compile install merge clean`


# index
https://www.tablesgenerator.com/markdown_tables

| category    | atom              | versions                    | working | latest                                                  |
|-------------|-------------------|-----------------------------|---------|---------------------------------------------------------|
| app-misc    | yazi              | 0.4.2                       | yes     | outdated. use `cargo install --locked yazi-fm yazi-cli` |
|             | tdf               | 0.1.0                       | no      |                                                         |
|             | ticker            | 5.0.2                       | yes     |                                                         |
| dev-python  | hsh               | 1.1.0                       | yes     |                                                         |
|             | llvmlite          | 0.44.0                      | yes     | requires llvm:15                                        |
|             | moviepy           | 2.1.2                       | yes     |                                                         |
|             | numba             | 0.61.2                      | yes     | python 3.13                                             |
|             | proglog           | 0.1.12                      | yes     |                                                         |
|             | commandlines      | 0.4.1-r2                    | yes     |                                                         |
|             | pymatting         | 1.1.13                      | yes     | python 3.13                                             |
| media-gfx   | backgroundremover | 0.2.8/0.3.4                 | yes     | install python modules manually                         |
| media-video | freetube          | 0.22.1/0.23.2/0.23.4/0.24.5 | yes     |                                                         |
| net-misc    | localsend         | 1.17.0                      | yes     | AppImage based                                          |
| x11-misc    | i3-resurrect      | 1.4.5                       | yes     | python 3.13                                             |
|             | i3status          | 2.15                        | yes     |                                                         |
|             | polybar           | 3.7.2                       | yes     | with patch (https://bugs.gentoo.org/953553)             |