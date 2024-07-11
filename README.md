Docker Apache Virtual Host Yapımı

Docker virtual host tanımalama yapıyoruz.

ilk önce local bilgisayarımızda hosts dosyasına çağırmak istedğimiz sanal alan adlarımızı tanımlıyoruz.
Burda dikkat etmek gereken durum docker içinde değil local bilgisayarımızda tanımlamamız gerekiyor.

windows için hosts dosya adresi : "c:\Windows\System32\Drivers\etc\hosts"

macos için hosts dosya adresi :"/etc/hosts" veya "/private/etc/hosts" 

ubuntu için hosts dosya adresi :"/etc/hosts"


hosts tanımlanacak  domainler:
127.0.0.1 site.prod
127.0.0.1 site.test

Dockerfile 'ımızın içinde php:8.2.0-apache image kendimize göre özelleştirdik.

site.prod.conf ve site.test.conf adında iki tane config dosyası oluşturuyoruz. config dosyalarımızda apache içerisinde bakacağı klasörleri belirtiyoruz.
Bunlar container ayağa kalkerken otomatik olarak kopyalanacaktır. Kopyalama işlemi Dockerfile içinde yapılmaktadır. 

docker-compose.yml dosyamızın içinde volumes oluşturarak local pc de bulunan www klasörünü container içine kopyalıyoruz. buradaki klasörler config de tanımladığımız klasörlerdir.

githubdan indirdiğimiz proje klasörünün içinde terminali açarak aşağıdaki komutu çalıştırıyoruz ve container ayağa kaldırıyoruz.

>    docker-compose up -d

daha sonra tanımış olduğumuz site.test "var/www/html/test" ve site.prod "var/www/html/prod"  adreslerine erişmek istedğimizde ilgili klasörün altındaki projeler açılacaktır.
url de açarken http:// isteği ile açılmasına dikkat edin.
[site.prod](http://site.prod/)
[site.test](http://site.test/)

blogger linki:https://hkmsmart.blogspot.com/2024/07/docker-apache-virtual-host.html
