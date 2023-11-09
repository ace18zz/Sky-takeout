Certainly, here is the translation formatted as a Markdown document:

```markdown
# Sky Takeout
This project is an online food ordering system developed using the Spring Boot framework.

## Technology Stack
### Backend Frameworks
- Spring Boot (3.1.2)
- MyBatis

### Databases
- MySQL
- Redis

### Frontend Frameworks
- Vue
- Uniapp
- ElementUI

### Frontend-Backend Communication
- RESTful API

## Setting up the Windows Development Environment
- Install Java JDK 17 and configure the environment variables.
- Install MySQL and Redis databases and create the corresponding databases.
- Create MySQL databases and tables: Run `mysql.sql`.
- Install the Maven build tool.
- Download and install Nginx with the following configuration:

```nginx
# Configure the following under the http section

map $http_upgrade $connection_upgrade {
    default upgrade;
    '' close;
}

upstream webservers {
    server 127.0.0.1:8080 weight=90;
    # server 127.0.0.1:8088 weight=10;
}

server {
    listen       80;
    server_name  localhost;

    location / {
        root   html/sky;
        index  index.html index.htm;
    }

    # Reverse proxy to handle requests sent by the management side
    location /api/ {
        proxy_pass   http://localhost:8080/admin/;
        # proxy_pass   http://webservers/admin/;
    }

    # Reverse proxy to handle requests sent by the user side
    location /user/ {
        proxy_pass   http://webservers/user/;
    }

    # WebSocket
    location /ws/ {
        proxy_pass   http://webservers/ws/;
        proxy_http_version 1.1;
        proxy_read_timeout 3600s;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "$connection_upgrade";
    }

    location /media {
        root Path to media files; # e.g., D:/static
        # Note: Create a media folder in the D:/static directory
    }
}
```

- Clone the project locally `git clone https://github.com/Sonder-MX/sky-take-out.git`
- Modify the configuration file `application.yml`:

```yaml
spring:
  datasource:
    url: jdbc:mysql://url
    username: root
    password: database password
  data:
    redis:
      password: Redis database password
```

- Create a new `application-env.yml` file in the resources directory and write the following configuration:

```yaml
sky:
  wechat:
    appid: Obtainable by applying for a WeChat Mini Program
    secret: Obtainable by applying for a WeChat Mini Program
    mchid: Merchant number
    mchSerialNo:
    privateKeyFilePath:
    apiV3Key:
    weChatPayCertFilePath:
    notifyUrl:
    refundNotifyUrl:
```

- Run the project.
```
