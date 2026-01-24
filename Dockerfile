FROM rust:1.92-slim AS builder

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/* && \
    rustup target add wasm32-wasip1 && \
    cargo install cargo-auditable

WORKDIR /workspace
# Copy .git directory first to ensure git-version can access it
COPY .git .git
COPY . .
RUN cargo fetch
RUN cargo auditable build --release --target wasm32-wasip1

FROM scratch
WORKDIR /
COPY --from=builder /workspace/target/wasm32-wasip1/release/plugin.wasm /plugin.wasm
