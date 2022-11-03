git clone https://github.com/emscripten-core/emsdk.git
emsdk/emsdk_env.sh'

./emsdk install latest
./emsdk activate latest

emcmake cmake ./
make
