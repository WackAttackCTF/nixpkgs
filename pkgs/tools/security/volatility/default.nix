{ stdenv, fetchFromGitHub, pythonPackages }:

pythonPackages.buildPythonApplication rec {
  version = "2.6.1-unstable-2020-12-11";
  pname = "volatility";


  src = fetchFromGitHub {
    owner = "volatilityfoundation";
    repo = "volatility";
    rev = "a438e768194a9e05eb4d9ee9338b881c0fa25937";
    hash = "sha256-U/iWPztn47/Tcz/etVduG7V/Nu5Z1jb+i0mutaKr9sM=";
  };

  doCheck = false;

  propagatedBuildInputs = [ pythonPackages.pycrypto pythonPackages.distorm3 ];

  meta = with stdenv.lib; {
    homepage = "https://www.volatilityfoundation.org/";
    description = "Advanced memory forensics framework";
    maintainers = with maintainers; [ bosu ];
    license = stdenv.lib.licenses.gpl2Plus;
  };
}
