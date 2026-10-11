# Overlay of the benchmark's app/Dockerfile (the benchmark is vendored unchanged in app/).
# What differs from upstream:
# - the COPY sources point into app/app/ (this folder is the build context);
# - the FLAG build argument defaults to this lab's fixed flag, the value upstream's Makefile passes (FLAG{sha256 of the benchmark id}), since the spec passes no build arguments.
# Everything else is upstream's, line for line.

FROM python:3.12

COPY app/app/ /app

WORKDIR /app

RUN pip install --no-cache-dir -r requirements.txt

ARG FLAG=FLAG{ef9d74447312d7c3d6273f6be7d69abe30b4c8e42bd9ca9002086be3f038d3b0}

RUN sed -i s/FLAG/$FLAG/g flag.txt

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]

# CyberCTF per-player flag: the flag above is only the development fallback. ctf-entrypoint.sh
# puts the player's flag (CTF_FLAG_MAIN) in its place at every start, then runs the original
# entrypoint and command, repeated here unchanged.
COPY ctf-entrypoint.sh /usr/local/bin/ctf-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/ctf-entrypoint.sh"]
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
