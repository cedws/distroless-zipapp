FROM python:3.9-slim AS build

COPY . src/

RUN pip install -t src -r src/requirements.txt
RUN python -m zipapp -c -m demo:main -o demo.pyz src

FROM gcr.io/distroless/python3

COPY --from=build /demo.pyz /

USER nonroot

CMD ["/demo.pyz"]
