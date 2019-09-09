@echo off
REM build and cache boost on Windows N.B. if no output for 10 minutes it's killed by travis. 
REM if set every command to verbose it's killed too for "too much output"...
if not exist "C:/local/boost/libs" (
        echo "Boost not cached, compiling it"
		rem wget -q https://dl.bintray.com/boostorg/release/1.71.0/source/boost_1_71_0.7z
		wget -q -O boost.exe https://dl.bintray.com/boostorg/release/1.71.0/binaries/boost_1_71_0-msvc-14.1-64.exe
		echo "Boost downloaded"
		rem 7z x boost_1_71_0.7z -bb1 -oC:/local | C:\Windows\System32\findstr.exe /r /c:”cpp”
		rem cd "C:/local/boost_1_71_0"
		rem C:/local/boost_1_71_0/bootstrap.bat 
		rem C:/local/boost_1_71_0/b2.exe -j16 toolset=msvc-14.1 address-model=64 architecture=x86 link=static threading=multi runtime-link=static --with-date_time --with-test --with-filesystem --with-program_options --with-regex --with-serialization --with-system --prefix=C:/local/boost stage
		rem echo "Boost compiled"
		rem C:/local/boost_1_71_0/b2.exe -j16 toolset=msvc-14.1 address-model=64 architecture=x86 link=static threading=multi runtime-link=static --with-date_time --with-test --with-filesystem --with-program_options --with-regex --with-serialization --with-system --prefix=C:/local/boost install > a.txt 2>&1
		boost.exe /SILENT /DIR=C:\local\boost 
		echo "Boost installed"
		cd C:/local/boost
		dir
) else echo "Boost already installed"