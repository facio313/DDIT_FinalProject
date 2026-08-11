FROM nginx:stable-alpine@sha256:97d490c12ba55b4946b01546d1c3ed324e8d41ab1c9fcb2a616aa470620e5b46

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY portfolio-demo/ /usr/share/nginx/html/
COPY portfolio-demo/ /usr/share/nginx/html/ddit-finalproject/
COPY source/INUProject/webapp/resources/images/bgpic.jpg /usr/share/nginx/html/assets/bgpic.jpg
COPY source/INUProject/webapp/resources/images/MAIN.png /usr/share/nginx/html/assets/main.png
COPY source/INUProject/webapp/resources/images/bgpic.jpg /usr/share/nginx/html/ddit-finalproject/assets/bgpic.jpg
COPY source/INUProject/webapp/resources/images/MAIN.png /usr/share/nginx/html/ddit-finalproject/assets/main.png

RUN nginx -t

EXPOSE 80
