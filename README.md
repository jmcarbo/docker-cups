```
docker run -ti --rm -e CUPS_USER_ADMIN=admin -e CUPS_USER_PASSWORD=blabla  -p 8084:631 bla
```

execute to allow remote administration

```
cupsctl --remote-admin --remote-any --share-printers
```
