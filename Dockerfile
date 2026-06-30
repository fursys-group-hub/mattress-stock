# 정적 웹페이지(index.html 한 개)를 nginx로 서빙하는 단일 컨테이너 설정
FROM nginx:stable-alpine

# 앱 본체를 nginx 웹루트로 복사
COPY index.html /usr/share/nginx/html/index.html

# 사내 서버가 접속할 포트
EXPOSE 80

# 컨테이너가 정상인지 주기적으로 점검(정적 페이지 응답 확인)
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -q --spider http://localhost/ || exit 1
