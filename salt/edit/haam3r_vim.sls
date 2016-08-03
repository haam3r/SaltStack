include:
  - edit.vim

/home/haam3r/.vimrc:
  file.managed:
    - source: salt://edit/haam3r_vimrc 
    - mode: 640
    - user: haam3r
    - group: haam3r
    - require:
      - sls: edit.vim

/home/haam3r/.vim:
  file.recurse:
    - source: salt://edit/vim
    - user: haam3r
    - group: haam3r
    - file_mode: 700
    - dir_mode: 700
    - include_empty: True
