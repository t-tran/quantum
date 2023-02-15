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
	github.com/coreos/bbolt v1.3.3 // indirect
	github.com/coreos/etcd v3.3.25+incompatible
	github.com/coreos/go-semver v0.3.0 // indirect
	github.com/coreos/go-systemd v0.0.0-20191104093116-d3cd4ed1dbcf // indirect
	github.com/coreos/pkg v0.0.0-20180928190104-399ea9e2e55f // indirect
	github.com/dgrijalva/jwt-go v3.2.0+incompatible // indirect
	github.com/dustin/go-humanize v1.0.0 // indirect
	github.com/gogo/protobuf v1.3.1 // indirect
	github.com/golang/groupcache v0.0.0-20200121045136-8c9f03a8e57e // indirect
	github.com/golang/snappy v0.0.2
	github.com/google/btree v1.0.0 // indirect
	github.com/google/uuid v1.0.0 // indirect
	github.com/gorilla/websocket v0.0.0-20170926233335-4201258b820c // indirect
	github.com/grpc-ecosystem/go-grpc-middleware v1.0.1-0.20190118093823-f849b5445de4 // indirect
	github.com/grpc-ecosystem/go-grpc-prometheus v1.2.0 // indirect
	github.com/grpc-ecosystem/grpc-gateway v1.9.5 // indirect
	github.com/jonboulle/clockwork v0.2.2 // indirect
	github.com/prometheus/client_golang v1.11.1 // indirect
	github.com/soheilhy/cmux v0.1.4 // indirect
	github.com/tmc/grpc-websocket-proxy v0.0.0-20170815181823-89b8d40f7ca8 // indirect
	github.com/vishvananda/netlink v1.1.0
	github.com/xiang90/probing v0.0.0-20190116061207-43a291ad63a2 // indirect
	go.etcd.io/bbolt v1.3.3 // indirect
	go.uber.org/zap v1.16.0 // indirect
	golang.org/x/crypto v0.0.0-20200622213623-75b288015ac9
	golang.org/x/lint v0.0.0-20201208152925-83fdc39ff7b5 // indirect
	golang.org/x/net v0.0.0-20201021035429-f5854403a974
	golang.org/x/time v0.0.0-20201208040808-7e3f01d25324 // indirect
	golang.org/x/tools v0.0.0-20201221201019-196535612888 // indirect
	google.golang.org/grpc v1.26.0 // indirect
	gopkg.in/yaml.v2 v2.4.0
	sigs.k8s.io/yaml v1.2.0 // indirect
)
