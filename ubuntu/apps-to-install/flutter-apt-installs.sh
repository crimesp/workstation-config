#for coverage reports during tests
sudo apt install lcov -y


#for cmake for flutter
sudo apt install cmake -y

#c language for flutter
sudo apt install clang  -y

#ninjav build for cmake/flutter
sudo apt install ninja-build  -y

#c libraries etc for flutter - note that you may require later versions of libstdc
sudo apt-get install clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev libstdc++-12-dev  -y


#deps for audioplayers (clients may need this too!)
sudo apt-get install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev  -y


#firebase cli
sudo curl -sL https://firebase.tools | bash
