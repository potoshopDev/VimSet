cd bin
del /Q *.exe
cd ..

//g++ *.cpp -o main.exe -lstdc++ -Bdynamic -std=c++17 -s
//clang++ -v -c *.h
clang++ -Wall -std=c++17 *.cpp -o main.exe   
//clang++ -v *.cpp -o main.exe -std=c++17 -g

strip main.exe

copy /Y main.exe bin
del /Q *.o
del /Q *.a
del /Q *.exe

call .\bin\main.exe
