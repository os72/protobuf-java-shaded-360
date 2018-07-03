use strict;
use warnings;
use File::Path;

mkdirs("java/core/src");
mkdirs("java/util/src");
mkdir "java/util/src/main/java/com/github/os72/protobuf360/util";
mkdir "java/util/src/test/java/com/github/os72/protobuf360/util";
mkdir "java/util/src/test/proto/com/github/os72/protobuf360/util";

shadeit("src/google/protobuf", "src/google/protobuf", ".proto");
shadeit("src/google/protobuf/compiler", "src/google/protobuf/compiler", ".proto");
shadeit("src/google/protobuf/testdata", "src/google/protobuf/testdata", ".proto");
shadeit("src/google/protobuf/util", "src/google/protobuf/util", ".proto");

shadeit("java/core/src/main/java/com/google/protobuf", "java/core/src/main/java/com/github/os72/protobuf360", ".java");
shadeit("java/core/src/test/java/com/google/protobuf", "java/core/src/test/java/com/github/os72/protobuf360", ".java");
shadeit("java/core/src/test/proto/com/google/protobuf", "java/core/src/test/proto/com/github/os72/protobuf360", ".proto");

shadeit("java/util/src/main/java/com/google/protobuf/util", "java/util/src/main/java/com/github/os72/protobuf360/util", ".java");
shadeit("java/util/src/test/java/com/google/protobuf/util", "java/util/src/test/java/com/github/os72/protobuf360/util", ".java");
shadeit("java/util/src/test/proto/com/google/protobuf/util", "java/util/src/test/proto/com/github/os72/protobuf360/util", ".proto");

rmtree "java/core/src/main/java/com/google" or die $!;
rmtree "java/core/src/test/java/com/google" or die $!;
rmtree "java/core/src/test/proto/com/google" or die $!;

rmtree "java/util/src/main/java/com/google" or die $!;
rmtree "java/util/src/test/java/com/google" or die $!;
rmtree "java/util/src/test/proto/com/google" or die $!;

sub shadeit
{
	my($dir_in, $dir_out, $suffix) = @_;
	opendir(DIR, $dir_in) or die $!;
	while (my $file = readdir(DIR)) {
		next unless ($file =~ m/$suffix$/);		
		print "$dir_in/$file\n";
		
		open(FIN, "<$dir_in/$file");
		open(FOUT, ">$dir_out/$file.tmp");
		while (my $line = <FIN>) {
			$line =~ s/com\.google\.protobuf/com.github.os72.protobuf360/g;
			$line =~ s/com\/google\/protobuf/com\/github\/os72\/protobuf360/g;
			print FOUT $line;
		}
		close(FIN);
		close(FOUT);
		
		rename "$dir_out/$file.tmp", "$dir_out/$file" or die $!;
	}
	closedir(DIR);
}

sub mkdirs
{
	my($dir_out) = @_;
	mkdir "$dir_out/main/java/com/github";
	mkdir "$dir_out/main/java/com/github/os72";
	mkdir "$dir_out/main/java/com/github/os72/protobuf360";
	mkdir "$dir_out/test/java/com/github";
	mkdir "$dir_out/test/java/com/github/os72";
	mkdir "$dir_out/test/java/com/github/os72/protobuf360";
	mkdir "$dir_out/test/proto/com/github";
	mkdir "$dir_out/test/proto/com/github/os72";
	mkdir "$dir_out/test/proto/com/github/os72/protobuf360";
}
