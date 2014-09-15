# Building the image yourself

```
git clone https://github.com/VladaTest/PushFakerDocker.git
cd PushFakerDocker
./bin/build
```

# Spawning the Faker

```
./bin/start \
    --name faker1 \
    --collectd 1.1.1.1 \
    --db 2.2.2.2 \
    --provider dump
```

You can also user optional paramethers to fine-tune settings:

```
optional parameters:
   --client_count        Number of clients Faker should create.              (Default 1)
   --client_key_count    Maxinmum number of keys generated per client.       (Default 100)
   --client_attr_count   Maxinmum number of attributes generated per client. (Default 10)
   --history_x_days      Generate history for last X days.                   (Default 7)
   --history_granularity How often data should be pushed. In seconds.        (Default 43200)
```
# Examples

```
./bin/start \
    --name faker2 \
    --db 2.2.2.2 \
    --provider dump \
    --image vladatest/push-faker \
    --host dh002 \
    --client_count 20 \
    --client_key_count 200 \
    --client_attr_count 10 \
    --history_x_days 7 \
    --history_granularity 3800 \
    --workers 20


./bin/start \
    --name faker1 \
    --db 2.2.2.2 \
    --provider dump \
    --image vladatest/push-faker \
    --client_count 5 \
    --history_x_days 1 \
    --workers 10


./bin/start \
    --name faker2 \
    --db 2.2.2.2 \
    --provider dump \
    --image vladatest/push-faker \
    --client_count 3 \
    --client_key_count 4 \
    --client_attr_count 5 \
    --history_x_days 6 \
    --history_granularity 7 \
    --workers 9
```
