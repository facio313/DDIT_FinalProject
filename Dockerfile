# check=skip=SecretsUsedInArgOrEnv
# PORTFOLIO_AUTH_MODE is a public branch contract, not a credential.
FROM nginx:stable-alpine@sha256:97d490c12ba55b4946b01546d1c3ed324e8d41ab1c9fcb2a616aa470620e5b46

ARG PORTFOLIO_BRANCH
ARG PORTFOLIO_AUTH_MODE
ENV PORTFOLIO_BRANCH=${PORTFOLIO_BRANCH} \
    PORTFOLIO_AUTH_MODE=${PORTFOLIO_AUTH_MODE}
LABEL work.bonifacio.portfolio.branch=${PORTFOLIO_BRANCH} \
      work.bonifacio.portfolio.auth-mode=${PORTFOLIO_AUTH_MODE}

RUN printf '%s\n%s\n' "$PORTFOLIO_BRANCH" "$PORTFOLIO_AUTH_MODE" \
      > /etc/portfolio-auth-build \
    && chmod 0444 /etc/portfolio-auth-build

COPY scripts/portfolio-auth-mode.sh /usr/local/bin/portfolio-auth-mode
RUN chmod 755 /usr/local/bin/portfolio-auth-mode \
    && /usr/local/bin/portfolio-auth-mode check

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY portfolio-demo/ /usr/share/nginx/html/
COPY portfolio-demo/ /usr/share/nginx/html/ddit-finalproject/
COPY source/INUProject/webapp/resources/images/bgpic.jpg /usr/share/nginx/html/assets/bgpic.jpg
COPY source/INUProject/webapp/resources/images/MAIN.png /usr/share/nginx/html/assets/main.png
COPY source/INUProject/webapp/resources/images/bgpic.jpg /usr/share/nginx/html/ddit-finalproject/assets/bgpic.jpg
COPY source/INUProject/webapp/resources/images/MAIN.png /usr/share/nginx/html/ddit-finalproject/assets/main.png

RUN nginx -t

EXPOSE 80
ENTRYPOINT ["/usr/local/bin/portfolio-auth-mode", "exec", "--", "/docker-entrypoint.sh"]
