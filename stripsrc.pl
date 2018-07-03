use strict;
use warnings;
use File::Path;

rmtree "src/solaris" or die $!;
unlink glob "src/*.*" or die $!;

rmtree "src/google/protobuf/compiler/cpp" or die $!;
rmtree "src/google/protobuf/compiler/csharp" or die $!;
rmtree "src/google/protobuf/compiler/java" or die $!;
#rmtree "src/google/protobuf/compiler/javanano" or die $!;
rmtree "src/google/protobuf/compiler/js" or die $!;
rmtree "src/google/protobuf/compiler/objectivec" or die $!;
rmtree "src/google/protobuf/compiler/php" or die $!;
rmtree "src/google/protobuf/compiler/python" or die $!;
rmtree "src/google/protobuf/compiler/ruby" or die $!;

rmtree "src/google/protobuf/io" or die $!;
rmtree "src/google/protobuf/stubs" or die $!;
rmtree "src/google/protobuf/testing" or die $!;

unlink glob  "src/google/protobuf/*.h" or die $!;
unlink glob  "src/google/protobuf/*.cc" or die $!;
unlink glob  "src/google/protobuf/compiler/*.h" or die $!;
unlink glob  "src/google/protobuf/compiler/*.cc" or die $!;
unlink glob  "src/google/protobuf/util/*.h" or die $!;
unlink glob  "src/google/protobuf/util/*.cc" or die $!;
unlink glob  "src/google/protobuf/util/internal/*.h" or die $!;
unlink glob  "src/google/protobuf/util/internal/*.cc" or die $!;
