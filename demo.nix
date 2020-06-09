{ stdenv ? pkgs.gcc9Stdenv
, pkgs ? import <nixpkgs> { }
 }:

 with pkgs;
  
stdenv.mkDerivation rec {
  name = "validator-1";
  version = "0.1.0";
  src = ./.;

  aws-lambda-cpp = stdenv.mkDerivation {
    name = "aws-lambda-cpp-${version}";
    version = "0.2.6";

    src = fetchFromGitHub {
        owner = "awslabs"; 
        repo = "aws-lambda-cpp";
        rev = "v${version}";
        sha256 = "05rfmi3pnkdiy8b7zhj4d3bn31s9qbg995hzslmpn0cal6cifrbr";
    };

    nativeBuildInputs = [ cmake curl ];

    meta = {
      description = "AWS C++ Lambda Runtime";
    };
  };

  nativeBuildInputs = [ cmake curl aws-lambda-cpp fmt ];

  meta = {
    description = "Some Validator";
  };
}
