## uhh zip n split:

run compress_assets.sh or do this:

```bash
tar cvzf - vpk/client_mp_s2s.bsp.pak000_000.vpk vpk/englishclient_mp_s2s.bsp.pak000_dir.vpk mod/maps/mp_s2s.bsp | split --bytes=90MB - compressed/assets.tar.gz.
```

## recombine:

run concat_assets.sh or do this:

```bash
cat compressed/assets.tar.gz.* > compressed/assets.tar.gz
tar -xvf compressed/assets.tar.gz
rm -f compressed/assets.tar.gz*
```