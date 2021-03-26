FROM rust as ion-poc
ADD . /ion
RUN cd ion \
 && RUSTUP=0 make # By default RUSTUP equals 1, which is for developmental purposes \
 && sudo make install prefix=/usr \
 && sudo make update-shells prefix=/usr


FROM scratch
COPY --from=ion-poc /ion/target/release/ion /usr/local/bin/
