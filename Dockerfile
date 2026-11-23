FROM alpine:latest

WORKDIR /site

COPY . .

# We expect a mount at /out for output files!
CMD grep -q ' /out ' /proc/self/mountinfo || { echo 'Missing mount: /out' >&2; exit 1; }; \
    internal_out=/site; \
    mkdir -p /out && cp -r $internal_out/. /out
