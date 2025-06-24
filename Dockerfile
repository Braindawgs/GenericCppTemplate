## Stage 1: Build
FROM ubuntu:22.04 AS dev

ENV DEBIAN_FRONTEND=noninteractive

# Install basic tools
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    gdb \
    git \
    zsh \
    curl \
    wget \
    ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended || true

SHELL ["/bin/bash", "-c"]
RUN chsh -s $(which zsh) root

WORKDIR /app

CMD ["zsh"]

## Stage 2: Builder
FROM dev AS builder

WORKDIR /app
COPY . .

RUN cmake -S . -B build && cmake --build build

## Stage 3: Runner

FROM ubuntu:22.04 AS runner

WORKDIR /app
COPY --from=builder /app/build/GenericCppTemplate .

CMD ["./GenericCppTemplate"]