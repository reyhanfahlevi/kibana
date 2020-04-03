FROM docker.elastic.co/kibana/kibana:7.5.1

RUN bin/kibana-plugin install https://releases.floragunn.com/search-guard-kibana-plugin-7/7.5.1-40.1.0/search-guard-kibana-plugin-7-7.5.1-40.1.0.zip

RUN rm -rf node_modules/caniuse-lite/* \
    && rm -rf node_modules/browserslist/* \
    && rm -rf node_modules/babel-preset-env/node_modules/caniuse-lite \
    && rm -rf node_modules/babel-preset-env/node_modules/browserslist \
    && curl -s $(curl -s https://registry.npmjs.org/browserslist/latest | grep -Po 'tarball":"\K[^"]*') \
    | tar -xvz --strip=1 -C ./node_modules/browserslist \
    && curl -s $(curl -s https://registry.npmjs.org/caniuse-lite/latest | grep -Po 'tarball":"\K[^"]*') \
    | tar -xvz --strip=1 -C ./node_modules/caniuse-lite