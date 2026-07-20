@echo on

set "PYO3_PYTHON=%PYTHON%"
set "CMAKE_GENERATOR=NMake Makefiles"
set OPENSSL_NO_VENDOR=1
set "OPENSSL_DIR=%LIBRARY_PREFIX%"

copy /Y "%SRC_DIR%\README.md" "%SRC_DIR%\connectorx-python\README.md"
if errorlevel 1 exit 1
copy /Y "%SRC_DIR%\LICENSE" "%SRC_DIR%\connectorx-python\LICENSE"
if errorlevel 1 exit 1

cd connectorx-python
%PYTHON% -m pip install --ignore-installed --no-deps -vv .
if errorlevel 1 exit 1

cd ..
cargo-bundle-licenses --format yaml --output THIRDPARTY.yml
if errorlevel 1 exit 1
