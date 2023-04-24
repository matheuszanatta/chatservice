createmigration:
	migrate create -ext=sql -dir=sql/migrations -seq init

migrate:
	# migrate -path=sql/migrations -database "mysql://root:root@tcp(localhost:3306)/chat_test" -verbose up
	migrate -path=sql/migrations -database "mysql://root:root@tcp(mysql)/chat_test" -verbose up # when using docker

migratedown:
	# migrate -path=sql/migrations -database "mysql://root:root@tcp(localhost:3306)/chat_test" -verbose drop
	migrate -path=sql/migrations -database "mysql://root:root@tcp(mysql)/chat_test" -verbose drop # when using docker

grpc:
	protoc --go_out=. --go-grpc_out=. proto/chat.proto --experimental_allow_proto3_optional

.PHONY: migrate createmigration migratedown