FROM scratch

ENV PORT 8000
EXPOSE $PORT

COPY canis /
CMD ["/canis"]
