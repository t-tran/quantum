module github.com/supernomad/quantum

go 1.15

replace (
	github.com/supernomad/quantum/common => ./common
	github.com/supernomad/quantum/datastore => ./datastore
	github.com/supernomad/quantum/device => ./device
	github.com/supernomad/quantum/metric => ./metric
	github.com/supernomad/quantum/plugin => ./plugin
	github.com/supernomad/quantum/rest => ./rest
	github.com/supernomad/quantum/router => ./router
	github.com/supernomad/quantum/socket => ./socket
	github.com/supernomad/quantum/worker => ./worker
)

require (
	github.com/GeertJohan/fgt v0.0.0-20160120143236-262f7b11eec0 // indirect
	github.com/coreos/bbolt v1.3.3 // indirect
	github.com/coreos/etcd v3.3.25+incompatible
	github.com/coreos/go-semver v0.3.0 // indirect
	github.com/coreos/go-systemd v0.0.0-20191104093116-d3cd4ed1dbcf // indirect
	github.com/coreos/pkg v0.0.0-20180928190104-399ea9e2e55f // indirect
	github.com/dustin/go-humanize v1.0.0 // indirect
	github.com/gogo/protobuf v1.3.1 // indirect
	github.com/golang/groupcache v0.0.0-20200121045136-8c9f03a8e57e // indirect
	github.com/golang/snappy v0.0.2
	github.com/jonboulle/clockwork v0.2.2 // indirect
	github.com/prometheus/client_golang v1.9.0 // indirect
	github.com/vishvananda/netlink v1.1.0
	go.uber.org/zap v1.16.0 // indirect
	golang.org/x/crypto v0.0.0-20200622213623-75b288015ac9
	golang.org/x/lint v0.0.0-20201208152925-83fdc39ff7b5 // indirect
	golang.org/x/net v0.0.0-20201021035429-f5854403a974
	golang.org/x/time v0.0.0-20201208040808-7e3f01d25324 // indirect
	golang.org/x/tools v0.0.0-20201221201019-196535612888 // indirect
	gopkg.in/yaml.v2 v2.4.0
	sigs.k8s.io/yaml v1.2.0 // indirect
)
