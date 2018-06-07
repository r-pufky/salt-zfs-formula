{%- from "zfs/map.jinja" import zfs with context -%}

zfs_package_dependencies:
  pkg.latest:
    - pkgs:
{%- for pkg in zfs.packages %}
      - {{ pkg }}
{%- endfor %}

zfs_kernel_module:
  kmod.present:
    - name: zfs
    - watch:
      - pkg: zfs_package_dependencies
