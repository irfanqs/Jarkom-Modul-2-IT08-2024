# Laporan Hasil Benchmark

Praktikum Modul 2 Jarkom Soal 15

### Algoritma Load Balancer yang digunakan

disini kami menggunakan adalah Round Robin, Least Connection, IP Hash, dan Generic Hash. Sementara masing-masing algortima digunakan pada masing-masing web server.

### Report hasil testing apache benchmark

untuk hasil testing adalah sebagai berikut

1. Round Robin (default)

**Tanjungkulai**

```
 root@HayamWuruk:~# ab -n 1000 -c 100 http://192.237.2.2:6969/
 This is ApacheBench, Version 2.3 <$Revision: 1706008 $>
 Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
 Licensed to The Apache Software Foundation, http://www.apache.org/

 Benchmarking 192.237.2.2 (be patient)
 Completed 100 requests
 Completed 200 requests
 Completed 300 requests
 Completed 400 requests
 Completed 500 requests
 Completed 600 requests
 Completed 700 requests
 Completed 800 requests
 Completed 900 requests
 Completed 1000 requests
 Finished 1000 requests

 Server Software:        nginx/1.10.3
 Server Hostname:        192.237.2.2
 Server Port:            6969

 Document Path:          /
 Document Length:        171 bytes

 Concurrency Level:      100
 Time taken for tests:   0.971 seconds
 Complete requests:      1000
 Failed requests:        0
 Total transferred:      317000 bytes
 HTML transferred:       171000 bytes
 Requests per second:    1029.43 [#/sec] (mean)
 Time per request:       97.141 [ms] (mean)
 Time per request:       0.971 [ms] (mean, across all concurrent requests)
 Transfer rate:          318.68 [Kbytes/sec] received

 Connection Times (ms)
            min  mean[+/-sd] median   max
 Connect:        4   42  12.2     45      61
 Processing:    19   51   6.8     52      70
 Waiting:       19   51   6.9     52      70
 Total:         23   94  13.5     97     109

 Percentage of the requests served within a certain time (ms)
 50%     97
 66%     98
 75%     98
 80%     99
 90%    100
 95%    103
 98%    104
 99%    104
 100%    109 (longest request)
```

**Bedahulu**

```
root@HayamWuruk:~# ab -n 1000 -c 100 http://192.237.2.4:6969/
This is ApacheBench, Version 2.3 <$Revision: 1706008 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking 192.237.2.4 (be patient)
Completed 100 requests
Completed 200 requests
Completed 300 requests
Completed 400 requests
Completed 500 requests
Completed 600 requests
Completed 700 requests
Completed 800 requests
Completed 900 requests
Completed 1000 requests
Finished 1000 requests

Server Software:        nginx/1.10.3
Server Hostname:        192.237.2.4
Server Port:            6969

Document Path:          /
Document Length:        167 bytes

Concurrency Level:      100
Time taken for tests:   1.190 seconds
Complete requests:      1000
Failed requests:        0
Total transferred:      313000 bytes
HTML transferred:       167000 bytes
Requests per second:    840.38 [#/sec] (mean)
Time per request:       118.993 [ms] (mean)
Time per request:       1.190 [ms] (mean, across all concurrent requests)
Transfer rate:          256.87 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        4   46  13.6     46      75
Processing:    19   63  23.0     64     470
Waiting:       19   63  23.0     63     470
Total:         23  109  28.6    113     520

Percentage of the requests served within a certain time (ms)
  50%    113
  66%    118
  75%    121
  80%    122
  90%    127
  95%    128
  98%    129
  99%    130
 100%    520 (longest request)
```

2. Least Connections (least_conn)

**Tanjungkulai**

```
root@HayamWuruk:~# ab -n 1000 -c 100 http://192.237.2.2:6969/
This is ApacheBench, Version 2.3 <$Revision: 1706008 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking 192.237.2.2 (be patient)
Completed 100 requests
Completed 200 requests
Completed 300 requests
Completed 400 requests
Completed 500 requests
Completed 600 requests
Completed 700 requests
Completed 800 requests
Completed 900 requests
Completed 1000 requests
Finished 1000 requests

Server Software:        nginx/1.10.3
Server Hostname:        192.237.2.2
Server Port:            6969

Document Path:          /
Document Length:        171 bytes

Concurrency Level:      100
Time taken for tests:   1.014 seconds
Complete requests:      1000
Failed requests:        0
Total transferred:      317000 bytes
HTML transferred:       171000 bytes
Requests per second:    986.49 [#/sec] (mean)
Time per request:       101.370 [ms] (mean)
Time per request:       1.014 [ms] (mean, across all concurrent requests)
Transfer rate:          305.39 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        4   40  12.4     40      69
Processing:    15   55   9.0     58      69
Waiting:       15   55   9.0     58      69
Total:         19   95  13.6     97     113

Percentage of the requests served within a certain time (ms)
  50%     97
  66%    100
  75%    101
  80%    102
  90%    104
  95%    106
  98%    107
  99%    107
 100%    113 (longest request)
```

**Bedahulu**

```
root@HayamWuruk:~# ab -n 1000 -c 100 http://192.237.2.4:6969/
This is ApacheBench, Version 2.3 <$Revision: 1706008 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking 192.237.2.4 (be patient)
Completed 100 requests
Completed 200 requests
Completed 300 requests
Completed 400 requests
Completed 500 requests
Completed 600 requests
Completed 700 requests
Completed 800 requests
Completed 900 requests
Completed 1000 requests
Finished 1000 requests

Server Software:        nginx/1.10.3
Server Hostname:        192.237.2.4
Server Port:            6969

Document Path:          /
Document Length:        167 bytes

Concurrency Level:      100
Time taken for tests:   1.160 seconds
Complete requests:      1000
Failed requests:        0
Total transferred:      313000 bytes
HTML transferred:       167000 bytes
Requests per second:    861.99 [#/sec] (mean)
Time per request:       116.010 [ms] (mean)
Time per request:       1.160 [ms] (mean, across all concurrent requests)
Transfer rate:          263.48 [Kbytes/sec] received

Connection Times (ms)
             min  mean[+/-sd] median   max
Connect:        6   41  11.1     40      75
Processing:    27   60  55.5     53     485
Waiting:       27   60  54.6     53     485
Total:         36  101  58.8     94     547

Percentage of the requests served within a certain time (ms)
 50%     94
 66%     97
 75%    100
 80%    102
 90%    115
 95%    126
 98%    137
 99%    492
100%    547 (longest request)
```

3. IP Hash (ip_hash)

**Tanjungkulai**

```
root@HayamWuruk:~# ab -n 1000 -c 100 http://192.237.2.2:6969/
This is ApacheBench, Version 2.3 <$Revision: 1706008 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking 192.237.2.2 (be patient)
Completed 100 requests
Completed 200 requests
Completed 300 requests
Completed 400 requests
Completed 500 requests
Completed 600 requests
Completed 700 requests
Completed 800 requests
Completed 900 requests
Completed 1000 requests
Finished 1000 requests

Server Software:        nginx/1.10.3
Server Hostname:        192.237.2.2
Server Port:            6969

Document Path:          /
Document Length:        171 bytes

Concurrency Level:      100
Time taken for tests:   0.988 seconds
Complete requests:      1000
Failed requests:        0
Total transferred:      317000 bytes
HTML transferred:       171000 bytes
Requests per second:    1012.30 [#/sec] (mean)
Time per request:       98.785 [ms] (mean)
Time per request:       0.988 [ms] (mean, across all concurrent requests)
Transfer rate:          313.38 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        5   36   9.1     38      54
Processing:    19   45  15.3     43     293
Waiting:       19   44  15.3     43     293
Total:         24   81  15.9     81     313

Percentage of the requests served within a certain time (ms)
  50%     81
  66%     82
  75%     83
  80%     85
  90%     90
  95%     93
  98%     93
  99%     94
 100%    313 (longest request)
```

**Bedahulu**

```
root@HayamWuruk:~# ab -n 1000 -c 100 http://192.237.2.4:6969/
This is ApacheBench, Version 2.3 <$Revision: 1706008 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking 192.237.2.4 (be patient)
Completed 100 requests
Completed 200 requests
Completed 300 requests
Completed 400 requests
Completed 500 requests
Completed 600 requests
Completed 700 requests
Completed 800 requests
Completed 900 requests
Completed 1000 requests
Finished 1000 requests

Server Software:        nginx/1.10.3
Server Hostname:        192.237.2.4
Server Port:            6969

Document Path:          /
Document Length:        167 bytes

Concurrency Level:      100
Time taken for tests:   1.163 seconds
Complete requests:      1000
Failed requests:        0
Total transferred:      313000 bytes
HTML transferred:       167000 bytes
Requests per second:    859.62 [#/sec] (mean)
Time per request:       116.331 [ms] (mean)
Time per request:       1.163 [ms] (mean, across all concurrent requests)
Transfer rate:          262.75 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        4   42  12.3     42      70
Processing:    29   60  50.8     55     479
Waiting:       25   59  48.9     55     479
Total:         33  102  53.5     97     531

Percentage of the requests served within a certain time (ms)
  50%     97
  66%    103
  75%    108
  80%    109
  90%    116
  95%    117
  98%    125
  99%    493
 100%    531 (longest request)
```

4. Generic Hash (hash $request_uri consistent)

**Tanjungkulai**

```
root@HayamWuruk:~# ab -n 1000 -c 100 http://192.237.2.2:6969/
This is ApacheBench, Version 2.3 <$Revision: 1706008 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking 192.237.2.2 (be patient)
Completed 100 requests
Completed 200 requests
Completed 300 requests
Completed 400 requests
Completed 500 requests
Completed 600 requests
Completed 700 requests
Completed 800 requests
Completed 900 requests
Completed 1000 requests
Finished 1000 requests

Server Software:        nginx/1.10.3
Server Hostname:        192.237.2.2
Server Port:            6969

Document Path:          /
Document Length:        171 bytes

Concurrency Level:      100
Time taken for tests:   1.010 seconds
Complete requests:      1000
Failed requests:        0
Total transferred:      317000 bytes
HTML transferred:       171000 bytes
Requests per second:    990.10 [#/sec] (mean)
Time per request:       101.000 [ms] (mean)
Time per request:       1.010 [ms] (mean, across all concurrent requests)
Transfer rate:          306.51 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        4   37  10.4     38      58
Processing:    20   49  15.1     49     326
Waiting:       20   49  12.3     49     159
Total:         24   87  15.9     88     345

Percentage of the requests served within a certain time (ms)
  50%     88
  66%     90
  75%     91
  80%     92
  90%     94
  95%     95
  98%     97
  99%    166
 100%    345 (longest request)
```

**Bedahulu**

```
 root@HayamWuruk:~# ab -n 1000 -c 100 http://192.237.2.4:6969/
 This is ApacheBench, Version 2.3 <$Revision: 1706008 $>
 Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
 Licensed to The Apache Software Foundation, http://www.apache.org/

 Benchmarking 192.237.2.4 (be patient)
 Completed 100 requests
 Completed 200 requests
 Completed 300 requests
 Completed 400 requests
 Completed 500 requests
 Completed 600 requests
 Completed 700 requests
 Completed 800 requests
 Completed 900 requests
 Completed 1000 requests
 Finished 1000 requests

 Server Software:        nginx/1.10.3
 Server Hostname:        192.237.2.4
 Server Port:            6969

 Document Path:          /
 Document Length:        167 bytes

 Concurrency Level:      100
 Time taken for tests:   1.225 seconds
 Complete requests:      1000
 Failed requests:        0
 Total transferred:      313000 bytes
 HTML transferred:       167000 bytes
 Requests per second:    816.51 [#/sec] (mean)
 Time per request:       122.472 [ms] (mean)
 Time per request:       1.225 [ms] (mean, across all concurrent requests)
 Transfer rate:          249.58 [Kbytes/sec] received

 Connection Times (ms)
               min  mean[+/-sd] median   max
 Connect:        4   41  13.1     41      71
 Processing:    26   62  61.9     50     490
 Waiting:       26   61  59.7     50     490
 Total:         31  103  65.2     90     550

 Percentage of the requests served within a certain time (ms)
   50%     90
   66%     96
   75%    102
   80%    103
   90%    119
   95%    132
   98%    378
   99%    535
  100%    550 (longest request)
```

**Round Robin (default)**:

- **Tanjungkulai**:
    - Requests per second: **1029.43 [#/sec]**
    - Time per request: **97.141 ms**
- **Bedahulu**:
    - Requests per second: **840.38 [#/sec]**
    - Time per request: **118.993 ms**

**Least Connections (least_conn)**:

- **Tanjungkulai**:
    - Requests per second: **986.49 [#/sec]**
    - Time per request: **101.370 ms**
- **Bedahulu**:
    - Requests per second: **861.99 [#/sec]**
    - Time per request: **116.010 ms**

**IP Hash (ip_hash)**:

- **Tanjungkulai**:
    - Requests per second: **1012.30 [#/sec]**
    - Time per request: **98.785 ms**
- **Bedahulu**:
    - Requests per second: **859.62 [#/sec]**
    - Time per request: **116.331 ms**

**Generic Hash (hash $request_uri consistent)**:

- **Tanjungkulai**:
    - Requests per second: **990.10 [#/sec]**
    - Time per request: **101.000 ms**
- **Bedahulu**:
    - Requests per second: **816.51 [#/sec]**
    - Time per request: **122.472 ms**

### Grafik Requests per Second untuk Masing-masing Algoritma

1. Round Robin
    
    ![image.png](image.png)
    
2. Least Connection
    
    ![image.png](image%201.png)
    
3. IP Hash
    
    ![image.png](image%202.png)
    
4. Generic Hash
    
    ![image.png](image%203.png)
    

Dari grafik-grafik terebut dapat dilihat bahwa web server Tanjungkulai memiliki performa yang lebih baik dibandingkan Bedahulu dalam keempat load balancer.

### Analisis

1. analisis setiap algoritma
    1. Round Robin
        
        dalam Round Robin, performa **Tanjungkulai** lebih baik dibandingkan **Bedahulu**, dengan request per second lebih tinggi dan time per request lebih rendah
        
    2. Least Connection
    Performanya di sini tidak jauh lebih baik daripada round-robin, terutama karena **Bedahulu** masih memiliki angka yang lebih rendah dibandingkan **Tanjungkulai**. Ini menunjukkan bahwa least connections tidak memberikan keuntungan signifikan dalam skenario ini.
    3. IP Hash
        
        **Tanjungkulai** menunjukkan performa yang baik dengan **1012.30 requests per second (RPS)** dan waktu per request **98.785 ms**, sementara **Bedahulu** mencatat **859.62 RPS** dengan waktu per request **116.331 ms**.
        
    4. Generic Hash
        
        **Tanjungkulai** mencapai **990.10 RPS** dengan waktu per request **101.000 ms**, dan **Bedahulu** memperoleh **816.51 RPS** dengan waktu per request **122.472 ms**. Algoritma ini sedikit kurang efisien dibandingkan IP Hash, tetapi berguna dalam situasi di mana cache yang konsisten penting untuk efisiensi server.
        
2. Kesimpulan
    
    Dari hasil pengujian, terlihat bahwa **Tanjungkulai** consistently memiliki **performa lebih baik** dibandingkan **Bedahulu** untuk semua algoritma. Berikut adalah beberapa faktor yang bisa menjelaskan perbedaan performa ini:
    
    1. **Requests per second** di Tanjungkulai selalu lebih tinggi daripada di Bedahulu.
    2. **Time per request** di Tanjungkulai juga lebih rendah, menunjukkan bahwa server Tanjungkulai dapat menangani permintaan lebih cepat.
    
    Alasan mengapa Tanjungkulai lebih cepat bisa karena beberapa faktor seperti spesifikasi Tanjungkulai yang lebih baik atau beban yang diterima lebih kecil selama pengujian.
    
    Sehingga:
    
    - **Round Robin** memberikan performa terbaik dalam hal **Requests per second** pada kedua server dibandingkan dengan algoritma lain.
    - **Tanjungkulai** adalah server dengan performa terbaik secara keseluruhan, menangani permintaan dengan lebih cepat dan efisien dibandingkan **Bedahulu**.

### Meme kecil
<p align="center">
<img src="images/292b6ba1-981a-46cf-8211-93e9512da8d5.webp">
</p>
