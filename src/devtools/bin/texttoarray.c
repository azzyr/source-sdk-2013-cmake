#include <stdio.h>
#include <stdlib.h>

int main( int argc, char **argv ) 
{
	if ( argc < 3 )
	{
		fprintf( stderr, "Usage: texttoarray <filename> <name>\n" );
		return 1;
	}

	FILE *f = fopen( argv[1], "rb" );
	if ( !f ) 
	{
		fprintf( stderr, "Error: cannot open file '%s'\n", argv[1] );
		return 1;
	}

	fseek( f, 0, SEEK_END );
	long size = ftell( f );
	rewind( f );

	unsigned char *data = malloc( size );
	if ( !data )
	{
		fprintf( stderr, "Error: out of memory\n" );
		fclose( f );
		return 1;
	}

	fread( data, 1, size, f );
	fclose( f );

	printf( "static unsigned char %s[] = {\n    ", argv[2] );
	for ( long i = 0; i < size; i++ )
	{
		printf( "0x%02x,", data[i] );
		if (i % 20 == 19)
			printf("\n    ");
	}

	printf("0x00\n};\n");

	free(data);
	return 0;
}