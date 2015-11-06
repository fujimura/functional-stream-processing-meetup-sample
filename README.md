# functional-stream-processing-meetup-sample

Sample program for http://connpass.com/event/20174

## How to run

```
$ wget ftp://ita.ee.lbl.gov/traces/NASA_access_log_Aug95.gz
$ gzip -d NASA_access_log_Aug95.gz
$ stack ghci
λ :load Main
λ :main -l NASA_access_log_Aug95 -- -l: Lazy, -h: Handle, -i: io-streams
```
