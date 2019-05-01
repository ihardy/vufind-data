# vufind-data
Sample data for vufind / folio integration testing. Just a modified version of the [sample data loading script](https://github.com/folio-org/mod-inventory-storage/blob/master/sample-data/import.sh) from mod-inventory-storage

## usage
For FOLIO, import records into mod-inventory-storage. Edit the import.sh script with the URL of your FOLIO instance. Before runningthis you'll need to get a auth token.
```
./import.sh diku $TOKEN
```
For vufind:
See the [documentation on indexing](https://vufind.org/wiki/indexing:marc) for more detail.
```
/usr/local/vufind/import-marc.sh bpl104.mrc
```

